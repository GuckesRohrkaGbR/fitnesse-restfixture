#!/bin/sh
PORT="9090"
CLASSPATH="target/dependencies/*"
JAVA="$(which java)"

FITNESSE_SOURCES="src/main/resources"

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  FITNESSE_SOURCES="src\\main\\resources"
fi

/usr/bin/mkdir -p "${FITNESSE_SOURCES}"
"${JAVA}" -cp "${CLASSPATH}" fitnesseMain.FitNesseMain -p ${PORT} -d "${FITNESSE_SOURCES}" -e 0