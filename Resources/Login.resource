*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***
${server}                 http://54.207.181.205:8080/lobbo    
${Email_tutor}            Marco.toto123@icloud.com
${Password_tutor}         12345@Kk 
${Email_veterinario}      netoye2222@muzitp.com
${Password_veterinario}   433@mA  

*** Keywords ***
Criando id para tutor
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary      email=${Email_tutor}    password=${Password_tutor}    typeUser=GUARDIAN
    ${response}    POST On Session    alias=Lobbo   url=/login   headers=${header}    json=${data}    expected_status=200

Criando id para veterinário
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary      email=${Email_veterinario}    password=${Password_veterinario}   typeUser=VETERINARY
    ${response}    POST On Session    alias=Lobbo   url=/login   headers=${header}    json=${data}    expected_status=200