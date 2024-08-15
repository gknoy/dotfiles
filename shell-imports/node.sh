# Set up Node things (nodeenv)

# Directory where we store our node virtual environments
NODE_ENV_DIR=~/.node-envs
function vnode () {
    if [[ -d ${NODE_ENV_DIR}/$1 ]]
    then
        . ${NODE_ENV_DIR}/$1/bin/activate
        export PATH="${PATH}:node_modules/.bin"
    else
        nodeenv --node $1 --prebuilt ${NODE_ENV_DIR}/$1
        . ${NODE_ENV_DIR}/$1/bin/activate
        export PATH="${PATH}:node_modules/.bin"
    fi
}

# get this version from ${project} node-modules
[[ -d ~/.node-envs/8.9.3 ]] && . ~/.node-envs/8.9.3/bin/activate 1>&2
