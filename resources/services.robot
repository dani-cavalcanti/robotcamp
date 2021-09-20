***Settings***
Documentation       Camada de serviços do projeto de automação

Library     Collections
Library     RequestsLibrary
Resource    helpers.robot

***Variables***
${base_api_url}=             http://zepalheta-api:3333         

***Keywords***
## Helpers
Get Session Token
    ${resp}=        Post Session            admin@zepalheta.com.br  pwd123

    ${token}=       Convert To String       Bearer ${resp.json()['token']} 

    [Return]        ${token}

##  POST /sessions
Post Session
    [Arguments]     ${email}        ${password}

    Create Session    zp-api                 ${base_api_url}        

    &{headers}=       Create Dictionary       Content-Type=application/json
    &{payload}=       Create Dictionary       email=${email}        password=${password}

    ${resp}=          Post Request       zp-api         /sessions     data=${payload}      headers=${headers}
 
    [Return]       ${resp}  

## POST /customers
POST Customer 
    [Arguments]     ${payload}

    Create Session      zp-api          ${base_api_url}
    
    ${token}=         Get Session Token
    &{headers}=       Create Dictionary       Content-Type=application/json     Authorization=${token}  

    ${resp}=          Post Request       zp-api         /customers     data=${payload}      headers=${headers}

    [Return]        ${resp}  

## PUT /customers
Put Customer 
    [Arguments]     ${payload}      ${user_id}

    Create Session      zp-api          ${base_api_url}
    
    ${token}=         Get Session Token
    &{headers}=       Create Dictionary       Content-Type=application/json     Authorization=${token}  

    ${resp}=          Post Request       zp-api         /customers/${user_id}     data=${payload}      headers=${headers}

    [Return]        ${resp}  

##GET /customers
Get Customers
    
    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token
    ${headers}=     Create Dictionary       Content-type=application/json       Authorization=${token}

    ${resp}=        GET On Session     zp-api      /customers          headers=${headers}

    [Return]        ${resp}

Get Unique Customer
    [Arguments]     ${user_id}
    
    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token
    ${headers}=     Create Dictionary       Content-type=application/json       Authorization=${token}

    ${resp}=        GET On Session     zp-api      /customers/${user_id}          headers=${headers}

    [Return]        ${resp}

##DELETE /customers
Delete Customer
    [Arguments]     ${cpf}

    ${token}=       Get Session Token
    &{headers}=       Create Dictionary       Content-Type=application/json     Authorization=${token}  

    DELETE On Session      zp-api         /customers/${cpf}     headers=${headers}