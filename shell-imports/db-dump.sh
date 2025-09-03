# helpers to dump arms db with names

# dump-pg some-name
function dump-pg () {
    # Write a named sql dump
    # use xz instead of gzip
    docker exec -t $(docker ps | grep postgres | cut -c -12) \
           pg_dumpall -c -U postgres \
        | xz -z -e > ~/tmp/db-dumps/${1:-dump}_$(date +%d-%m-%Y"_"%H_%M_%S).sql.xz
}

# restore-pg filename
function restore-pg () {
    fname="${1}"
    ext=$fname:t:e
    echo "fname: $fname\next: $ext"
    if [[ $ext == "gz" ]]; then
        gunzip "${1}" --to-stdout | \
            docker exec -i $(docker ps | grep postgres | cut -c -12) \
                psql --quiet --echo-errors -U postgres \
                | xargs -L1 echo -n '.'
    elif [[ $ext == "xz" ]]; then
        xz --stdout "${1}" | \
            docker exec -i $(docker ps | grep postgres | cut -c -12) \
                psql --quiet --echo-errors -U postgres \
                | xargs -L1 echo -n '.'
    fi

}
