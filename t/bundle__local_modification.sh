#!/bin/sh

hsh clone "git/simple_package/.git" \
    || test_fail "clone simple_package failed"

hsh clone "git/simple_package2/.git" \
    || test_fail "clone simple_package2 failed"

hsh clone "git/simple_package3/.git" \
    || test_fail "clone simple_package3 failed"

echo "simple_file3 v2" >> "simple_file3"

hsh bundle && test_fail "bundle command failed"
[ -e "hsh_bundle.run" ] && test_fail "bundle does not exists"
true

