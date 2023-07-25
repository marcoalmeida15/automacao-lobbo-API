*** Settings ***
Resource            ../Resources/VaccineforPet.resource

*** Test Cases ***
Cenário 01 - Create VaccineforPet
    Criando vacina

Cenário 02 - Get Vaccine
    Buscando vacinas


Cenário 03 - Put Vaccine
    Atualizando vacina

Cenário 04 - Delete Vaccine
    Deletando vacina
    