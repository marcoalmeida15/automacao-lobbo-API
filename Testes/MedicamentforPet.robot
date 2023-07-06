*** Settings ***
Resource            ../Resources/MedicamentforPet.resource

*** Test Cases ***
Cenário 01 - Create Medicament 
    ${ProdutoId}    Criando medicamento
    Set Suite Variable    ${ProdutoId}     ${ProdutoId["medicamentId"]}

Cenário 02 - Get Medicament
    ${response}    Buscando medicamento
    Set Test Variable    ${GetProdutoId}     ${response}[-1][medicamentId]
    Should Be Equal      ${GetProdutoId}     ${ProdutoId}  

Cenário 03 - Put Medicament
    Atualizando medicamento    ${ProdutoId}    2    

Cenário 04 - Delete Medicament
    Deletando medicamento    ${ProdutoId}
