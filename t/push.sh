#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"

echo "new file content" > "new file"

hsh add "simple_package" "new file" || test_fail "add failed"

hsh status "simple_package" --short 
hsh status "simple_package" --short | grep -q "^ *A *\"new file\"$" || test_fail "file not added"

hsh commit "simple_package" -m "new file" || test_fail "commit failed"

hsh status "simple_package" | grep -q "ahead" || test_fail "commit not created"

hsh push "simple_package"  || test_fail "push failed" 

hsh status "simple_package" | grep -q "up to date"|| test_fail "commit not created"

