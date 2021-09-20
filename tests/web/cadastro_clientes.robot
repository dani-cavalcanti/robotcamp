***Settings***
Documentation       Cadastro de clientes

Resource            ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    [Tags]      smoke
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         Bon Jovi        00000001406     Ruas dos Bugs, 1000     11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:    Cliente cadastrado com sucesso!
    E esse cliente deve ser exibido na lista

Cliente duplicado
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         Danielle    10367478757     Rua 62, 175 casa 2     21992005187
    Mas esse CPF já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:    Este CPF já existe no sistema!

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...         ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faço a inclusão desse cliente 
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é obrigatório      
    [Template]  Validação de Campos
    ${EMPTY}     00000001406     Ruas dos Bugs, 1000     11999999999         ${NAME}

CPF é obrigatório
    [Template]  Validação de Campos
    Danielle        ${EMPTY}        Rua 62,175 casa 2       21992005187     ${CPF}

Endereço é obrigatório
    [Template]  Validação de Campos
    Danielle    10367478757     ${EMPTY}        219920005187                ${ADDRESS}

Telefone é obrigatório
    [Template]  Validação de Campos
    Danielle    10367478757     Rua 62, 175 casa 2      ${EMPTY}            ${CELL_PHONE}

Telefone incorreto
    [Template]  Validação de Campos
    Danielle    10367478757     Rua 62, 175 casa 2      12385930            ${TEL_INV}

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}     ${cpf}      ${endereco}     ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto:     ${saida}






