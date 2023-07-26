*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}                http://54.207.181.205:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA
${petId}                 29
${userId}                31
${userId2}               30

*** Keywords ***
Criando invite
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}      Create Dictionary    petId=29    typeNotification=ANTIFLEA_DAY    userIdReceive=3    userIdSend=31
    ${response}    POST On Session    alias=Lobbo    url=/notification/invite   headers=${header}    json=${data}    expected_status=200

Marcar como lido
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    POST On Session    alias=Lobbo    url=/notification/read/${userId}   headers=${header}    expected_status=200

Buscando todas as informações do usuário
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/notification/${userId}    headers=${headers}    expected_status=200

Lendo uma notificação
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    PUT On Session    alias=Lobbo    url=/notification/${userId2}    headers=${header}    expected_status=200