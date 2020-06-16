#!/bin/sh

hsh clone "git/simple_package/.git" \
    || test_fail "clone simple_package failed"

hsh clone "git/simple_package2/.git" \
    || test_fail "clone simple_package2 failed"

hsh clone "git/simple_package3/.git" \
    || test_fail "clone simple_package3 failed"

hsh clone "git/package_dep/.git" \
    || test_fail "clone package_dep failed"

hsh bundle || test_fail "bundle command failed"
[ -e "hsh_bundle.run" ] || test_fail "bundle does not exists"

mkdir new_root
cd new_root 
../hsh_bundle.run
[ -e ".hsh" ] || test_fail "hsh dir not created "
[ -e "bin/hsh" ] || test_fail "hsh script not extracted"
[ -e "simple_file" ] || test_fail "simple_file not extracted"
[ -e "simple_subdir/simple_subfile" ] || test_fail "simple_subfile not extracted"
[ -e ".hsh/repos/simple_package" ] || test_fail "simple_package not extracted"
[ -e "simple_file2" ] || test_fail "simple_file2 not extracted"
[ -e "simple_subdir2/simple_subfile2" ] || test_fail "simple_subfile2 not extracted"
[ -e ".hsh/repos/simple_package2" ] || test_fail "simple_package2 not extracted"
[ -e "simple_file3" ] || test_fail "simple_file3 not extracted"
[ -e "simple_subdir3/simple_subfile3" ] || test_fail "simple_subfile3 not extracted"
[ -e "simple_package3_created_by_bundle_in" ] || test_fail "simple_package3_created_by_bundle_in missing"
[ -e "simple_package3_created_by_bundle_out" ] || test_fail "simple_package3_created_by_bundle_out missing"
[ -e ".hsh/repos/simple_package3" ] || test_fail "simple_package3 not extracted"
[ -e "file_dep" ] || test_fail "file_dep missing"
[ -e "subdir_dep/subfile_dep" ] || test_fail "subdir_dep/subfile_dep missing"

