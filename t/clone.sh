#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"

[ -e "simple_file" ] || test_fail "simple_file not checked out"
[ -e "simple_subdir/simple_subfile" ] || test_fail "simple_subfile not checked out"


