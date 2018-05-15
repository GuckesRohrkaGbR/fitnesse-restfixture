set PORT="9090"
set CLASSPATH="target/dependencies/*"
set JAVA="java"

set FITNESSE_SOURCES="src\main\resources"
set FITNESSE_INIT="c:\opt\fitnesse-initial"

md "%FITNESSE_SOURCES%"

IF EXISTS "%FITNESSE_SOURCES%/FitNesseRoot" (
  echo "No previous fitnesse installation found, setting up first initial config."
  cp -r %FITNESSE_INIT%\* %FITNESSE_SOURCES%
)

"%JAVA%" -cp "%CLASSPATH%" fitnesseMain.FitNesseMain -p %PORT% -d "%FITNESSE_SOURCES%" -e 0