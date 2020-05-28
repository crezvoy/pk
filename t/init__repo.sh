#! /bin/bash

hsh init "test" || test_fail "init command failed"

[ -d ".hsh/repos/test/objects" ] || test_fail "package not initialized"

