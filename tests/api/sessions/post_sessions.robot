*** Settings ***
Resource        ../../../resources/services.robot

*** Test Cases ***
Login com Sucesso 
    ${resp}=          Post Session       admin@zepalheta.com.br         pwd123
    Status Should Be        200       ${resp}  
    
Senha incorreta
    ${resp}=          Post Session       admin@zepalheta.com.br         pwd456
 
    Status Should Be        401       ${resp}  

Usuário não cadastrado
    ${resp}=          Post Session       404@zepalheta.com.br         pwd123
 
    Status Should Be        401       ${resp}  

