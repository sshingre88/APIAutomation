@echo off
setlocal enabledelayedexpansion

REM Define output directory for reports
set REPORT_DIR=reports
if not exist %REPORT_DIR% mkdir %REPORT_DIR%

REM Run APIResources
echo Running APIResources...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json  --folder "APIResources" --reporters cli,html --reporter-html-export %REPORT_DIR%\APIResources.html
if errorlevel 1 echo APIResources failed.

REM Run Characters > GetSingleCharacter
echo Running GetSingleCharacter...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json --folder "GetSingleCharacter" --reporters cli,html --reporter-html-export %REPORT_DIR%\GetSingleCharacter.html
if errorlevel 1 echo GetSingleCharacter failed.

REM Run Characters > GetAllCharacters
echo Running GetAllCharacters...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json --folder "GetAllCharacters" --reporters cli,html --reporter-html-export %REPORT_DIR%\GetAllCharacters.html
if errorlevel 1 echo GetAllCharacters failed.

REM Run Characters > GetMultipleCharacters
echo Running GetMultipleCharacters...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json --folder "GetMultipleCharacters" --reporters cli,html --reporter-html-export %REPORT_DIR%\GetMultipleCharacters.html --iteration-data TestData/Characters.json
if errorlevel 1 echo GetMultipleCharacters failed.

REM Run Characters > Pagination
echo Running Pagination...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json --folder "Pagination" --reporters cli,html --reporter-html-export %REPORT_DIR%\Pagination.html
if errorlevel 1 echo Pagination failed.

REM Run Characters > FilterCharacters
echo Running FilterCharacters...
newman run collections/WitnessAI-Assessment.postman_collection.json --environment Config/Production.postman_environment.json --folder "FilterCharacters" --reporters cli,html --reporter-html-export %REPORT_DIR%\FilterCharacters.html --iteration-data TestData/CharacterFilters.json
if errorlevel 1 echo FilterCharacters failed.

echo All Newman folder tests complete.
pause
