#! /bin/sh

hsh config hsh github.username crezvoy

hsh clone "github.com/crezvoy/hsh-test.git" || test_fail "clone failed"

[ -e "github_file" ] || test_fail "github_file not checked out"
[ -e "github_subdir/github_subfile" ] || test_fail "github_subfile not checked out"


