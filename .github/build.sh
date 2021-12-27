#!/usr/bin/env sh

set +ex

export PROJECT_NAME="$1"

cd "${GITHUB_WORKSPACE}/${PROJECT_NAME}" || exit
lein do clean, check, test, compile, uberjar, native, run-native
EXIT_CODE=$?

cd "${GITHUB_WORKSPACE}" || exit

RESULT_DIR=".github/matrix/results/project-clojure-java-graalvm-leiningen-os"
mkdir -p "${RESULT_DIR}"
RESULT_FILE="${PROJECT_NAME},${CLOJURE_VERSION},${JAVA_VERSION},${GRAALVM_VERSION},${LEININGEN_VERSION},${OS_VERSION}"
echo $EXIT_CODE >> "${RESULT_DIR}/${RESULT_FILE}"

exit 0
