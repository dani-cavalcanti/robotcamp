*** Settings ***
Resource        ../../../resources/services.robot



***Test Cases***
Create customers

  #  ${payload}=            Get Json        customers/luzia.json

    ${payload}=             Get Json   customers/unique.json

    Delete Customer     ${payload['cpf']}
    ${resp}=          POST Customer   ${payload}
 
    Status Should Be     200       ${resp}      

Name is required

    ${payload}=            Get Json         customers/no_name.json
    
    ${resp}=          POST Customer   ${payload}
 
    Status Should Be     400       ${resp}
    Should Be Equal      ${resp.json()['message']}       "name" is required   

CPF is required

    ${payload}=            Get Json         customers/no_cpf.json
    
    ${resp}=          POST Customer   ${payload}
 
    Status Should Be     400       ${resp}
    Should Be Equal      ${resp.json()['message']}       "cpf" is required   

Address is required

    ${payload}=            Get Json         customers/no_address.json

    ${resp}=          POST Customer   ${payload}
 
    Status Should Be     400       ${resp}
    Should Be Equal      ${resp.json()['message']}       "address" is required   

Phone Number is required

    ${payload}=           Get Json          customers/no_phone.json

    ${resp}=          POST Customer   ${payload}
 
    Status Should Be     400       ${resp}
    Should Be Equal      ${resp.json()['message']}       "phone_number" is required   


