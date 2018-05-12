#!/bin/sh
PORT="9090"
CLASSPATH="target/dependencies/*"
JAVA="$(which java)"

FITNESSE_SOURCES="src/main/resources"
FITNESSE_INIT="/opt/fitnesse-initial"

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  FITNESSE_SOURCES="src\\main\\resources"
fi

mkdir -p "${FITNESSE_SOURCES}"

if [ ! -e "${FITNESSE_SOURCES}/FitNesseRoot" ]; then
  echo "No previous fitnesse installation found, setting up first initial config."
  cp -r ${FITNESSE_INIT}/* ${FITNESSE_SOURCES}
fi

"${JAVA}" -cp "${CLASSPATH}" fitnesseMain.FitNesseMain -p ${PORT} -d "${FITNESSE_SOURCES}" -e 0