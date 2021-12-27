#!/usr/bin/env sh

set +ex

cd "${GITHUB_WORKSPACE}" || exit

mkdir -p .github/matrix/results/clojure-java-graalvm-leiningen-os

for RESULT in .github/matrix/results/project-clojure-java-graalvm-leiningen-os/*
do
  RESULT_FILE=".github/matrix/results/clojure-java-graalvm-leiningen-os/${CLOJURE_VERSION},${JAVA_VERSION},${GRAALVM_VERSION},${LEININGEN_VERSION},${OS_VERSION}.csv"
	echo "${RESULT},$(cat "${RESULT}")" >> "${RESULT_FILE}"
done
