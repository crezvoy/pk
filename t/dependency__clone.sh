#! /bin/sh

hsh clone git/package_dep/.git

[ -e file_dep ] || test_fail "file_dep missing"
[ -e subdir_dep/subfile_dep ] || test_fail "subfile_dep missing"

[ -e simple_file3 ] || test_fail "simple_file3 missing"
[ -e simple_subdir3/simple_subfile3 ] || test_fail "simple_subfile3 missing"
