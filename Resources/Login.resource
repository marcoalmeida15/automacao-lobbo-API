*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***
${server}    http://54.233.135.201:8080/lobbo    
${password}     123456789 

*** Keywords ***
Criando id para tutor
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary      email=Roberto20@gmail.com    password=12345@Kk    typeUser=GUARDIAN
    ${response}    POST On Session    alias=Lobbo   url=/login   headers=${header}    json=${data}    expected_status=200

Criando id para veterinário
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary      email=marcu15@gmail.com    password=433@mA    typeUser=VETERINARY
    ${response}    POST On Session    alias=Lobbo   url=/login   headers=${header}    json=${data}    expected_status=200