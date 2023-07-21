*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***
${server}                http://54.233.135.201:8080/lobbo 
${token}                 Bearer    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjozMSxcImVtYWlsXCI6XCJSb2JlcnRvMjBAZ21haWwuY29tXCIsXCJuYW1lXCI6XCJSb2JlcnRvXCIsXCJ0eXBlVXNlclwiOlwiR1VBUkRJQU5cIn0iLCJ1c2VySWQiOjMxLCJ1c2VyIjoie1widXNlcklkXCI6MzEsXCJlbWFpbFwiOlwiUm9iZXJ0bzIwQGdtYWlsLmNvbVwiLFwibmFtZVwiOlwiUm9iZXJ0b1wiLFwidHlwZVVzZXJcIjpcIkdVQVJESUFOXCJ9IiwiaWF0IjoxNjg2NTc4OTMxfQ.523j-v1dd7b1fa6O_gzpdgU0xtsQD_PmjeJDscH_Qqs7SUosq5blvf6MCed-il2DmddfZZXGR5iAS2RLuP8bMA

*** Keywords ***
Criando usuário   
    ${random_string}=    Generate Random String    length=4    chars=[LETTERS]    
    ${email}=    Set Variable    ${random_string}\@gmail.com
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary   cpf=048-306-320-00    email=${email}   lastName=Henrique    name=Marquinho    phoneNumber=51996152068    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    typeUser=VETERINARY
    ${response}    POST On Session    alias=Lobbo   url=/user  headers=${header}    json=${data}    expected_status=200 
    Set Suite Variable    ${UserId}    ${response.json().get("userId")}
    Set Suite Variable    ${email}    ${response.json().get("email")}

Buscando dados do usuário
    Create Session    alias=Lobbo    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Lobbo    url=/user/${UserId}   headers=${headers}    expected_status=200

Atualizando dados do usuário
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary   cpf=048-306-320-00    email=${email}    lastName=Henrique    name=Marquinho    phoneNumber=51996152068    picture=https://pixabay.com/pt/photos/filhote-de-cachorro-2785074/    typeUser=VETERINARY
    ${response}    PUT On Session    alias=Lobbo   url=/user/${UserId}   headers=${header}    json=${data}    expected_status=200 

Esqueci minha senha 
    Create Session    alias=Lobbo    url=${server}
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}      Create Dictionary    email=${email} 
    ${response}    POST On Session    alias=Lobbo    url=/user/forgot-my-password   headers=${header}    json=${data}    expected_status=200
    Set Suite Variable    ${firebasetoken}    ${response.json().get("firebaseToken")}

Verificando token
    Create Session    alias=Lobbo    url=${server} 
    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary      token=${firebasetoken}    userId=${UserId}
    ${response}    PUT On Session    alias=Lobbo   url=/user/token-firebase   headers=${header}    json=${data}    expected_status=200
