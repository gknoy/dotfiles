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

# Preserve the existing default environment when it is installed.
if [[ -f "$NODE_ENV_DIR/12.16.1/bin/activate" ]]; then
    . "$NODE_ENV_DIR/12.16.1/bin/activate" 1>&2
fi
