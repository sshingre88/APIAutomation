@echo off
REM Run APIResources
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "APIResources" --environment Config/Production.postman_environment.json

REM Run Characters > GetSingleCharacter
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "GetSingleCharacter" --environment Config/Production.postman_environment.json

REM Run Characters > GetAllCharacters
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "GetAllCharacters" --environment Config/Production.postman_environment.json

REM Run Characters > GetMultipleCharacters
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "GetMultipleCharacters" --environment Config/Production.postman_environment.json --iteration-data TestData/Characters.json


REM Run Characters > Pagination
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "Pagination" --environment Config/Production.postman_environment.json

REM Run Characters > FilterCharacters
newman run collections/WitnessAI-Assessment.postman_collection.json --folder "FilterCharacters" --environment Config/Production.postman_environment.json --iteration-data TestData/CharacterFilters.json
