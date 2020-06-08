#! /bin/sh

hsh clone "git/simple_package/.git"

hsh dependency simple_package add "git/simple_package2/.git"

[ -e "simple_file2" ] || test_fail "dependency not installed" 

[ -e "simple_subdir2/simple_subfile2" ] || test_fail "dependency not installed" 

hsh commit simple_package -m "added dependency"

git --git-dir ".hsh/repos/simple_package" show  HEAD:.hshdependencies | grep -q "git/simple_package2/.git"  || test_fail "dependency not recorded"

hsh dependency simple_package rm "git/simple_package2/.git"

hsh commit simple_package -m "removed dependency"

git --git-dir ".hsh/repos/simple_package" show  HEAD:.hshdependencies | grep -q "git/simple_package2/.git"  && test_fail "dependency not remove"

true
