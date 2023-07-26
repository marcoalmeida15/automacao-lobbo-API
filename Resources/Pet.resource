*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource    ../Resources/AlimentationforPet.resource

*** Variables ***
${server}                http://54.207.181.205:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjoxNyxcImVtYWlsXCI6XCJNYXJjby50b3RvMTIzQGljbG91ZC5jb21cIixcIm5hbWVcIjpcIk1hcmN1XCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjE3LCJ1c2VyIjoie1widXNlcklkXCI6MTcsXCJlbWFpbFwiOlwiTWFyY28udG90bzEyM0BpY2xvdWQuY29tXCIsXCJuYW1lXCI6XCJNYXJjdVwiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg4NzY2MDk4fQ.VPpQoTKnv-tv7RSqQ86fVzKfk7_vL475d1BXUgBhkWiX2rrWQhgq8fogztrlQDWgk2ZnbrHl3nQ9TitXiXVopA

*** Keywords ***
Criando pet
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}      Create Dictionary    birthday=2023-06-12    breedId=30    castrated=true    gender=MALE    name=Pitoco    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    size=BIG
    ${response}    POST On Session    alias=Lobbo    url=/pet   headers=${header}    json=${data}    expected_status=200
    Set Suite Variable    ${petId}    ${response.json().get("petId")}

Buscando pet por Id
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/pet/${petId}    headers=${headers}    expected_status=200

Atualizando pet
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}      Create Dictionary    birthday=2023-06-12    breedId=27    castrated=true    gender=MALE    name=Pitoco    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    size=BIG
    ${response}    PUT On Session    alias=Lobbo    url=/pet/${petId}    headers=${header}    json=${data}    expected_status=200

Deletando pet
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}       
    ${response}    DELETE On Session   alias=Lobbo    url=/pet/${petId}   headers=${header}    expected_status=200

Criando Observação
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}      Create Dictionary   observation=Ele está mal
    ${response}    PUT On Session    alias=Lobbo    url=/pet/observation/${petId}    headers=${header}    json=${data}    expected_status=200

# Adicionando usuário para o pet
#     Create Session    alias=Lobbo    url=${server}
#     ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
#     ${response}    PATCH On Session    alias=Lobbo    url=/pet/29/add/179    headers=${headers}    expected_status=200

# Rejeitando usuário para o pet
#     Create Session    alias=Lobbo    url=${server}
#     ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
#     ${response}    PATCH On Session    alias=Lobbo    url=/pet/29/reject/179    headers=${headers}    expected_status=200

# Removendo usuário para o pet
#     Create Session    alias=Lobbo    url=${server}
#     ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
#     ${response}    PATCH On Session    alias=Lobbo    url=/pet/29/remove/3    headers=${headers}    expected_status=200