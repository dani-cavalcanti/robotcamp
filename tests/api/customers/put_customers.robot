*** Settings ***
Resource        ../../../resources/services.robot



***Test Cases***
Update a Customer 

    ${payload} =    Get Json                customers/bianca.json

    Delete Customer     ${payload['cpf']}
    ${resp}=        POST Customer           ${payload}
    ${user_id}=     Convert To String       ${resp.json()['id']}

    Set To Dictionary       ${payload}      name        Bernardo Henrique da Conceição

    ${resp}=         Put Customer   ${payload}       ${user_id}

    Status Should Be        204     ${resp}

    ${resp}=         Get Unique Customer        ${user_id}

    Should Be Equal         ${resp.json()['name']}      Bernardo Henrique da Conceição