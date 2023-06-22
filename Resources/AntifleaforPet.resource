*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}                http://54.233.135.201:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA
${petId}                 27
${antifleaid}            36

*** Keywords ***
Criando antiflea
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary    doseDate=2023-06-12    mg=20 mg    name=antipulgas    petId=${petId}    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    repeatDose=2    repeatFrequency=DAY
    ${response}    POST On Session    alias=Lobbo   url=/antiflea   headers=${header}    json=${data}    expected_status=200

Buscando antiflea
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/antiflea/${petId}   headers=${headers}    expected_status=200
  
Atualizando antiflea 
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary    doseDate=2023-06-12    mg=40 mg    name=antipulgas    petId=${petId}    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    repeatDose=2    repeatFrequency=DAY
    ${response}    PUT On Session    alias=Lobbo   url=/antiflea/${antifleaid}    headers=${header}    json=${data}    expected_status=200

Deletando antiFlea
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    Delete On Session    alias=Lobbo    url=/antiflea/${antifleaid}   headers=${headers}    expected_status=200