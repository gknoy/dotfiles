# helpers to dump arms db with names

# dump-pg some-name
function dump-pg () {
    # Write a named sql dump
    # use xz instead of gzip
    docker exec -t $(docker ps | grep postgres | cut -c -12) \
           pg_dumpall -c -U postgres \
        | xz -z -e > ~/tmp/db-dumps/${1:-dump}_$(date +%Y-%m-%d"_"%H_%M_%S).sql.xz
}

# restore-pg filename [project-name]
function restore-pg () {
    fname="${1}"
    curdir=$(pwd | sed 's!.*/!!')
    project="${2:-$curdir}"
    db="${project}-db"
    ext=$fname:t:e

    echo "Applying snapshot to db: $db"
    echo "fname: $fname\next: $ext"
    if [[ $ext == "gz" ]]; then
        gunzip "${1}" --to-stdout | \
            docker exec -i $(docker ps | grep " $db"| cut -c -12) \
                psql --quiet --echo-errors -U postgres \
                | xargs -L1 echo -n '.'
    elif [[ $ext == "xz" ]]; then
        xz --decompress --stdout "${1}" | \
            docker exec -i $(docker ps | grep " $db" | cut -c -12) \
                psql --quiet --echo-errors -U postgres \
                | xargs -L1 echo -n '.'
    fi
}
