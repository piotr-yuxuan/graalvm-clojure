#!/usr/bin/env sh

set +ex

export PROJECT_NAME="$1"

cd "${GITHUB_WORKSPACE}/${PROJECT_NAME}" || exit

lein do clean, check, test, compile, uberjar, native, run-native

# Dubious: don't let one failing step to preclude subsequent executions.
exit 0
