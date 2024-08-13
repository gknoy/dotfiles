# helpers to dump arms db with names

# dump-pg some-name
function dump-pg () {
    # Write a named sql dump
    docker exec -t $(docker ps | grep postgres | cut -c -12) \
           pg_dumpall -c -U postgres \
        | gzip > ~/tmp/db-dumps/${1:-dump}_$(date +%d-%m-%Y"_"%H_%M_%S).sql.gz
}

# restore-pg filename
function restore-pg () {
    gunzip "${1}" --to-stdout | \
        docker exec -i $(docker ps | grep postgres | cut -c -12) \
               psql --quiet --echo-errors -U postgres \
               | xargs -L1 echo -n '.'
}
