*** Settings ***
Resource    ../Resources/AlimentationforPet.resource

*** Test Cases ***
Cenário 01 - Create alimentation
    Criando alimentação

Cenário 02 - Put alimentation
    Atualizando alimentação

Cenário 03 - Delete alimentation
    Deletando alimentação

    Pegando histórico de alimentação 

Cenário 05 - GetAllSize
    Obtendo tamanho do pet

Cenário 06 GetSize
    Obtendo tamanho do pet por Id