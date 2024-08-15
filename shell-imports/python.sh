#
# python dev helpers
#


function black-pr() {
    base=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
    if [[ "$base" == "" ]]; then
        base='dev'
    fi
    git diff "${base}" --name-only | grep .py | grep -v migrations | xargs black
}
