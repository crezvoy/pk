#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"
hsh clone "git/simple_package2/.git" || test_fail "clone failed"
hsh clone "git/simple_package3/.git" || test_fail "clone failed"

echo "new file content" > "new file"
echo "new file 2 content" > "new file 2"

hsh add "simple_package" "new file" || test_fail "add failed"

hsh add "simple_package2" "new file 2" || test_fail "second add failed"


hsh commit all -m "new files" || test_fail "commit failed"

hsh status "simple_package" | grep -q "ahead" || test_fail "commit not created"
hsh status "simple_package2" | grep -q "ahead" || test_fail "second commit not created"
hsh status "simple_package3" | grep -q "ahead" && test_fail "unnecessary commit created"
true

