#! /bin/sh

hsh clone "git/simple_package3/.git" || test_fail "clone failed"

[ -e "simple_file3" ] || test_fail "simple_file not checked out"
[ -e "simple_subdir3/simple_subfile3" ] || test_fail "simple_subfile not checked out"
[ -e "simple_package3_created_by_clone" ] || test_fail "hook failed"


