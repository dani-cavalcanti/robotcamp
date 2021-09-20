***Settings***
Documentation       Cadastro de equipamentos

Resource            ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo Equipamento 
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento e diária
    ...         Bateria Acústica Profire Completa Vermelha       560,00
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação:    Equipo cadastrado com sucesso!

Equipamento Duplicado
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento e diária
    ...     Harpa   101,01
    Mas esse equipamento já existe no sistema
    Quando faço a inclusão desse equipamento
    Então devo ver a notificação de erro:   Erro na criação de um equipo

Nome obrigatório
    [Template]  Validação de Campos
    ${EMPTY}    139,99      Nome do equipo é obrigatório

Valor obrigatório
    [Template]  Validação de Campos
    Saxofone    ${EMPTY}    Diária do equipo é obrigatória
# Bug encontrado: se inserir 0 não reclama!

***Keywords***
Validação de Campos
    [Arguments]     ${eq_name}      ${eq_price}     ${saida}
    
    Dado que acesso o formulário de cadastro de equipamentos
    E que eu tenho o seguinte equipamento e diária    ${eq_name}    ${eq_price}
    Quando faço a inclusão desse equipamento
    Então devo ver erro no campo    ${saida}
