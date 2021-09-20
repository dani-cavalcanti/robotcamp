*** Settings ***
Resource        ../../../resources/services.robot



***Test Cases***
Get Customer List

    ${list}=        Get Json   customers/list.json

    FOR     ${item}     IN      @{list['data']}
        POST Customer   ${item}
    END

    ${resp}=        Get Customers
    Status Should Be            200         ${resp}
    ${total}=       Get Length              ${resp.json()}
    Should Be True      ${total} > 0

Get Unique Customer

    ${origin}=      Get Json   customers/unique.json

    Delete Customer  ${origin['cpf']}
    ${resp}=        POST Customer           ${origin}
    ${user_id}=     Convert To String       ${resp.json()['id']}

    ${resp}=        Get Unique Customer     ${user_id}

    Status Should Be    200                         ${resp}
    Should Be Equal     ${resp.json()['cpf']}       ${origin['cpf']}


Customer Not Found

    ${resp}         Get Unique Customer        884ce16b-ae23-47f8-8c50-c32b54672714

    Status Should Be        404                                 ${resp}
    Should Be Equal         ${resp.json()['message']}           Customer not found