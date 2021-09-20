***Keywords***
##Login
Acesso a página Login
    Go To       ${base_url} 
    
Submeto minhas credenciais
    [Arguments]     ${email}        ${password}

    Login With  ${email}        ${password}

Devo ver a área logada
    Wait Until Page Contains       Aluguéis     5
   
Devo ver um toaster com a mensagem
    [Arguments]     ${expect_message}

    Wait Until ELement Contains    ${TOASTER_ERROR_P}      ${expect_message}

##Save Customers
Dado que acesso o formulário de cadastro de clientes
    Go To customers
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}           5
    Click Element                       ${CUSTOMERS_FORM}

E que eu tenho o seguinte cliente:
        [Arguments]         ${name}     ${cpf}      ${address}      ${phone_number}
        
        Remove Customer By cpf      ${cpf}  

        Set Test Variable           ${name}
        Set Test Variable           ${cpf}
        Set Test Variable           ${address}
        Set Test Variable           ${phone_number}

Mas esse CPF já existe no sistema
        Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

Quando faço a inclusão desse cliente
        Register New Customers      ${name}     ${cpf}      ${address}      ${phone_number}

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
        Wait Until Element Contains      ${LABEL_NAME}                    ${NAME}                     5
        Wait Until Element Contains      ${LABEL_CPF}                     ${CPF}                      5
        Wait Until Element Contains      ${LABEL_ADDRESS}                 ${ADDRESS}                  5
        Wait Until Element Contains      ${LABEL_PHONE_NUMBER}            ${CELL_PHONE}               5

Então devo ver o texto:
    [Arguments]     ${expect_text}

    Wait Until Page Contains        ${expect_text}      5

E esse cliente deve ser exibido na lista

    ${cpf_formatado}=                   Format Cpf      ${cpf}
    Go Back
    Wait Until Element Is Visible       ${CUSTOMER_LIST}       5
    Table Should Contain                ${CUSTOMER_LIST}       ${cpf_formatado} 

Então devo ver a notificação:
        [Arguments]         ${expect_notice}

        Wait Until Element Contains         ${TOASTER_SUCESS}     ${expect_notice}    3
        

Então devo ver a notificação de erro:
        [Arguments]         ${expect_notice}

        Wait Until Element Contains         ${TOASTER_ERROR}     ${expect_notice}    5   

Então devo ver erro no campo
    [Arguments]     ${error_message}
    
    Wait Until Page Contains    ${error_message}    3

##Remove Customers
Dado que eu tenha um cliente indesejado:
    [Arguments]                 ${name}     ${cpf}      ${address}      ${phone_number}
    
    Remove Customer By cpf                  ${cpf}
    Insert Customer             ${name}     ${cpf}      ${address}      ${phone_number}

    Set Test Variable                       ${cpf}

E acesso a lista de clientes
    Go To customers

Quando eu removo esse cliente
    ${cpf_formatado}=                   Format Cpf      ${cpf}
    Set Test Variable                   ${cpf_formatado} 

    Go To Customer Details              ${cpf_formatado}
    Click Remove Customer

E esse cliente não deve aparecer na lista
    Wait Until Page Does Not Contain     ${cpf_formatado}


## Equipos 
Dado que acesso o formulário de cadastro de equipamentos
    Wait Until Element is Visible       ${NAV_EQUIPOS}      5
    Click Element                       ${NAV_EQUIPOS}
    Wait Until Element is Visible       ${EQUIPOS_FORM}     5
    Click Element                       ${EQUIPOS_FORM}

E que eu tenho o seguinte equipamento e diária
    [Arguments]     ${eq_name}     ${eq_price}

    Remove Equipo By Name      ${eq_name}

    Set Test Variable   ${eq_name}
    Set Test Variable   ${eq_price}

Mas esse equipamento já existe no sistema
    Insert Equipo       ${eq_name}     ${eq_price}

Quando faço a inclusão desse equipamento
    Register New Equipo     ${eq_name}     ${eq_price}
    Sleep   5

Então devo ver mensagens informando que os campos do cadastro de equipamentos são obrigatórios
    Wait Until Element Contains     ${LABEL_EQ_NAME}        Nome do equipo é obrigatório        5
    Wait Until Element Contains     ${LABEL_EQ_PRICE}       Diária do equipo é obrigatória      5

