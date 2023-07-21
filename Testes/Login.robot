*** Settings ***
Resource            ../Resources/Login.resource
Resource            ../Resources/User.resource

*** Test Cases ***
Cenário 01 - Create GuardianId
    Criando id para tutor

Cenário 02 - Create VeterinaryId
    Criando id para veterinário