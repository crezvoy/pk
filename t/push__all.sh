#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"
hsh clone "git/simple_package2/.git" || test_fail "clone failed"
hsh clone "git/simple_package3/.git" || test_fail "clone failed"

echo "simple_file v2" >> "simple_file"
echo "simple_file2 v2" >> "simple_file2"

hsh add all -u || test_fail "add failed"

hsh commit all -m "new files" || test_fail "commit failed"

hsh status "simple_package" | grep -q "ahead" || test_fail "commit not created"
hsh status "simple_package2" | grep -q "ahead" || test_fail "second commit not created"
hsh status "simple_package3" | grep -q "ahead" && test_fail "unnecessary commit created"

hsh push all || test_fail "push failed"

hsh status all | grep -q "ahead" && test_fail "commit not created"

true
