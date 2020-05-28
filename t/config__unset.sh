#! /bin/sh -x

hsh config hsh section.key "test value" || test_fail "config set failed"
val="$(hsh config hsh section.key)"
[ $? -eq 0 ] || test_fail "config get failed"
echo "++ $val"
[ "$val" = "test value" ] \
    || test_fail "incorrect value"

hsh config hsh section.anotherkey "another value" || test_fail "second config set failed"
val="$(hsh config hsh section.anotherkey)"
[ $? -eq 0 ] || test_fail "second config get failed"
echo "++ $val"
[ "$val" = "another value" ] \
    || test_fail "incorrect second value"

hsh config hsh --unset section.anotherkey || test_fail "config unset failed"

val="$(hsh config hsh section.anotherkey)"
[ $? -eq 0 ] && test_fail "get after unset should fail"
echo "++ $val"
[ "$val" = "" ] || test_fail "incorrect value after fail"
