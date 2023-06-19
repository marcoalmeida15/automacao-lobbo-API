*** Settings ***
Resource    ../Resources/User.resource
Library    OperatingSystem

*** Test Cases ***
Cenário 01 - Create user 
    Criando usuário 

Cenário 02 - Get User View DTO Byld
    Buscando dados do usuário

Cenário 03 - Update user Id
    Atualizando dados do usuário

Cenário 04 - I forgot My Password
    Esqueci minha senha 

Cenário 05 - ChangeTokenFirebaseCommand
    Verificando token