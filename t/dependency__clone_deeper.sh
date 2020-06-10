#! /bin/sh

hsh clone git/package_dep_deeper/.git

[ -e file_deeper ] || test_fail "file_deeper missing"
[ -e subdir_deeper/subfile_deeper ] || test_fail "subfile_deeper missing"

[ -e file_dep ] || test_fail "file_dep missing"
[ -e subdir_dep/subfile_dep ] || test_fail "subfile_dep missing"

[ -e simple_file3 ] || test_fail "simple_file3 missing"
[ -e simple_subdir3/simple_subfile3 ] || test_fail "simple_subfile3 missing"
