#!/bin/sh


hsh version || test_fail "install failed to run"

[ -d ".hsh/repos" ] || test_fail "hsh not initialized"
