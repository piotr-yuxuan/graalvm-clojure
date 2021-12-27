#!/usr/bin/env sh

set +ex

cd "${GITHUB_WORKSPACE}" || exit

cat "Project name,Clojure version, java version,GraalVM version,Leiningen version,OS version,Exit code" >> builds.csv

for RESULT in .github/matrix/results/clojure-java-graalvm-leiningen-os/*
do
	cat "${RESULT}" >> builds.csv
done
