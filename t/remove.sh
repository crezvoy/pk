#! /bin/sh

hsh clone git/simple_package3/.git

[ -e simple_file3 ] || test_fail "simple_file3 missing"
[ -e simple_subdir3/simple_subfile3 ] || test_fail "simple_subfile3 missing"

sh -x bin/hsh remove -y simple_package3

[ -e simple_file3 ] && test_fail "simple_file3 still present"
[ -e simple_subdir3/simple_subfile3 ] && test_fail "simple_subfile3 still present"

true
