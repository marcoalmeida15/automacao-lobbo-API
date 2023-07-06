*** Settings ***
Resource            ../Resources/AntifleaforPet.resource


*** Test Cases ***
Cenário 01 - Create antiflea
    ${antipulgaId}    Criando antiflea
    Log To Console    ${antipulgaId}
    Set Suite Variable    ${antipulgaId}     ${antipulgaId["antiFleaId"]}

# Cenário 02 - Get antiflea
#     ${response}    Buscando antiflea
#     Set Test Variable    ${GetAntipulgaId}     ${response}[0][antiFleaId]
#     Should Be Equal      ${GetAntipulgaId}     ${AntipulgasId}  

# Cenário 03 - Put antiFleaId
#     Atualizando antiflea    ${AntipulgasId}    antipulga

# Cenário 04 - Delete antiFlea
#     Deletando antiFlea    ${AntipulgasId}