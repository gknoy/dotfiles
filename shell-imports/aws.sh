# shell connections get stuck so make it easy to drop them
function kill-aws-connection () {
    ps ax | ag awskey | ag ssh | head -n 1 | pyp 'x.split()[0]' | xargs kill
}
