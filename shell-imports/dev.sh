# helpers for work stuff

# link to a PR from the current branch
function pr-link {
    GIT_DIR=`git rev-parse --git-dir 2>/dev/null`
    if [ -z "$GIT_DIR" ]; then
        return 0
    fi
    # git rev-parse --show-toplevel isn't working as advertized:
    #   [~/git/personal/dotfiles/shell-imports]$ git rev-parse --show-toplevel
    #   {~}/git/personal/dotfiles/shell-imports
    # So find the .git dir, and then strip that trailing part:
    repo_path=$(git rev-parse --git-dir | sed 's!/.git!!')
    GIT_HEAD=`cat $GIT_DIR/HEAD`
    GIT_BRANCH=${GIT_HEAD##*/}
    ORG_REPO_PAIR=$(git config --get remote.origin.url | sed 's/.*://' | sed 's/.git$//')
    echo "https://github.com/${ORG_REPO_PAIR}/compare/${GIT_BRANCH}?expand=1"
}


function _pytest() {
    # assumes run in project repo ;)
    ORG_REPO_PAIR=$(git config --get remote.origin.url | sed 's/.*://' | sed 's/.git$//')
    is_personal="$(pwd | grep personal)"
    repo_name=$(basename $(pwd))
    if [[ -n "${is_personal}" ]]; then
        # just run pytest directly for personal projects
        pytest --verbose --pdbcls=IPython.terminal.debugger:Pdb $@
    else
        # Run non-personal things w/ work dev tooling
        #   Note that this is very fragile, tested only for a few of our repos.
        #   We can always manually define this to just call pytest directly when
        #   the repo has a different testing scheme.
        args="-n0 --verbose --pdbcls=IPython.terminal.debugger:Pdb $@"
        # wipe out vault token for tests so we can run off vpn
        d_args="--volume '/dev/null:/srv/${repo_name}/.vault-token' --rm"
        DOCKER_COMPOSE_RUN_ARGS="${d_args}" make test-py ARGS="${args}"
    fi
}


function _cypress() {
    # get the most-recently-tagged dev + app images. In theory we shouldn't need both
    # but we use both of them when deciding what to build.
    app_hash=$(docker images| ag app- | head -1 | pyp 'x.split()[1]')
    dev_hash=$(docker images| ag dev- | head -1 | pyp 'x.split()[1]')

    docker_project=$(grep DOCKER_REGISTRY_PATH Makefile | sed 's/.* //')
    # get_work_docker_registry defined in ~/.secrets
    img="$(get_work_docker_registry)/${docker_project}"
    dev_img="${img}:${dev_hash}"
    app_img="${img}:${app_hash}"

    echo PULL_IMAGE=0 DOCKER_IMAGE_DEV_URL=${dev_img} DOCKER_IMAGE_APP_URL=${app_img} make cypress-test-ci TEST_ARGS="$@"
    PULL_IMAGE=0 DOCKER_IMAGE_DEV_URL=${dev_img} DOCKER_IMAGE_APP_URL=${app_img} make cypress-test-ci TEST_ARGS="$@"
}
