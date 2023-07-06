*** Settings ***
Resource            ../Resources/VaccineforPet.resource

*** Variables ***
${vacinneId}    = 0

*** Test Cases ***
Cenário 01 - Create VaccineforPet
    ${vacinneId}    Criando vacina
    Set Suite Variable    ${vacinneId}    ${vacinneId["vaccineId"]}

Cenário 02 - Get Vaccine
    ${response}    Buscando vacinas
    Set Test Variable    ${GetvacinneId}     ${response}[-1][vaccineId]
    Should Be Equal      ${GetVacinneId}     ${vacinneId} 

# Cenário 03 - Put Vaccine
#     Atualizando vacina

# Cenário 04 - Delete Vaccine
#     Deletando vacina
    