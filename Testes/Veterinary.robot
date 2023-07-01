*** Settings ***
Resource            ../Resources/Veterinary.resource

*** Test Cases ***
Cenário 01 - Create Veterinary
    Criando veterinário

Cenário 02 - Get Veterinary Id
    Buscando veterinário por Id

Cenário 03 - Get All Veterinary
    Buscando todos os veterinários cadastrados

Cenário 04 - Get Guardian Id Veterinary
    Buscando veterinário pelo tutor do pet