#! /bin/bash

hsh init "test" || test_fail "init command failed"

hsh init "test" && test_fail "init with existing repo should fail"

true


