#! /bin/sh

hsh clone git/package_dep_deeper/.git

[ -e file_deeper ] || test_fail "file_dep missing"
[ -e subdir_deeper/subfile_deeper ] || test_fail "subfile_dep missing"

[ -e file_dep ] || test_fail "file_dep missing"
[ -e subdir_dep/subfile_dep ] || test_fail "subfile_dep missing"

[ -e simple_file3 ] || test_fail "simple_file3 missing"
[ -e simple_subdir3/simple_subfile3 ] || test_fail "simple_subfile3 missing"

sh -x bin/hsh remove -y simple_package3

[ -e file_deeper ] && test_fail "file_dep missing"
[ -e subdir_deeper/subfile_deeper ] && test_fail "subfile_dep missing"

[ -e file_dep ] && test_fail "file_dep still present"
[ -e subdir_dep/subfile_dep ] && test_fail "subfile_dep still present"

[ -e simple_file3 ] && test_fail "simple_file3 still present"
[ -e simple_subdir3/simple_subfile3 ] && test_fail "simple_subfile3 still present"

true
