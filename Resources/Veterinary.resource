*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}                http://54.233.135.201:8080/lobbo   
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA
${UserId}                31

*** Keywords ***
Criando veterinário
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}    
    ${data}      Create Dictionary    address={address: rua joão marques 1640, Porto Alegre, cep: 99520000, city: Porto Alegre, complement: bairro sul brasileiro, district: Porto Alegre, number: 1640}, attendClinic=true, attendHome=true, clincalName=Petclinical, crmv=123456, generalClinic=true, specialty=["cachorro"], userId=${UserId}
    ${response}    POST On Session    alias=Lobbo   url=/veterinary   headers=${header}    json=${data}    expected_status=200
    Set Suite Variable    ${VeterinaryId}    ${response.json().get("veterinaryId")}