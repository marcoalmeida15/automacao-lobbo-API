*** Settings ***
Resource    ../Resources/Pet.resource

*** Test Cases ***
Cenário 01 - Create Pet
    Criando pet

Cenário 02 - Get pet Id
    Buscando pet por Id

Cenário 03 - Put pet Id
    Atualizando pet

Cenário 04 - Delete pet Id
    Deletando pet

Cenário 05 - Put Observation
    Criando Observação

# Cenário 06 - Add User Pet
#     Adicionando usuário para o pet

# Cenário 07 - Reject User Pet
#     Rejeitando usuário para o pet

# Cenário 08 - Remove User Pet
#     Removendo usuário para o pet