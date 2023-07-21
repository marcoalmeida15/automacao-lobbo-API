*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource    ../Resources/Pet.resource

*** Variables ***
${server}                http://54.233.135.201:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA
${Petid}                 4
${AlimentationSizeId}    17

*** Keywords ***
Criando alimentação
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary      alimentationSizeId=17    buy=2023-06-12    dailyDose=uma pílula    hour=14:00    petId=${petId}    product=ração    receiveNotification=true
    ${response}    POST On Session    alias=Lobbo   url=/alimentation   headers=${header}    json=${data}    expected_status=200
    Set Suite Variable    ${alimentationId}    ${response.json().get("alimentationId")}

Atualizando alimentação
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary      alimentationSizeId=17    buy=2023-06-12    dailyDose=duas pílulas    hour=14:00    petId=27    product=ração    receiveNotification=true
    ${response}    PUT On Session    alias=Lobbo   url=/alimentation/${alimentationId}   headers=${header}    json=${data}    expected_status=200

Deletando alimentação
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}       
    ${response}    DELETE On Session   alias=Lobbo    url=/alimentation/${alimentationId}    headers=${header}    expected_status=200

Pegando histórico de alimentação 
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/alimentation/${petId}    headers=${headers}    expected_status=200

Obtendo tamanho do pet
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/alimentation/size   headers=${headers}    expected_status=200

Obtendo tamanho do pet por Id
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/alimentation/size/${AlimentationSizeId}    headers=${headers}    expected_status=200