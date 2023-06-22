*** Settings ***
Library    RequestsLibrary
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}                http://54.233.135.201:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA
${petId}                 27
${vermifugeId}           21

*** Keywords ***
Criando vermífugo
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary      doseDate=2023-06-12    durationDose=2    durationFrequency=DAY    name=qualquer    petId=27    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    quantity="2"    receiveNotification=true    repeatDose=2    repeatFrequency=DAY    typeFrequencyDose=ONCE_1_DAY    weight=_11_25KG
    ${response}    POST On Session    alias=Lobbo   url=/vermifuge  headers=${header}    json=${data}    expected_status=200

Buscando vermífugo
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/vermifuge/${petId}    headers=${headers}    expected_status=200
    
Atualizando vermífugo
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary      doseDate=2023-06-12    durationDose=2    durationFrequency=DAY    name=qualquer    petId=27    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    quantity="2"    receiveNotification=true    repeatDose=2    repeatFrequency=DAY    typeFrequencyDose=ONCE_1_DAY    weight=_11_25KG
    ${response}    PUT On Session    alias=Lobbo   url=/vermifuge/${vermifugeId}  headers=${header}    json=${data}    expected_status=200

Deletando vermífugo
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}       
    ${response}    DELETE On Session   alias=Lobbo    url=/vermifuge/${vermifugeId}    headers=${header}    expected_status=200
