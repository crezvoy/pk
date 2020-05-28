#! /bin/sh -x

hsh config hsh section.key "test value" || test_fail "config set failed"
val="$(hsh config hsh section.key)"
[ $? -eq 0 ] || test_fail "config get failed"
echo "-- $val"
[ "$val" = "test value" ] \
    || test_fail "incorrect value"
