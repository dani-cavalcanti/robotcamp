***Settings***
Documentation       Login Tentativa

Resource            ../../../resources/base.robot

Suite Setup          Start Session
Suite Teardown      Finish Session

Test Template       Tentativa de Login

**Keywords***
Tentativa de login
    [Arguments]     ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a página Login
    Submeto minhas credenciais  ${input_email}  ${input_senha}
    Devo ver um toaster com a mensagem  ${output_mensagem}
    
***Test Cases***
Senha incorretas                admin@zepalheta.com.br      abc123          Ocorreu um erro ao fazer login, cheque as credenciais.
Senha em branco                 danicacoelho@gmail.com      ${EMPTY}        O campo senha é obrigatório!
E-mail em branco                ${EMPTY}                    pwd123          O campo email é obrigatório!
E-mail e senha em branco        ${EMPTY}                    ${EMPTY}        Os campos email e senha não foram preenchidos!
Login incorreto                 admin&gmail.com             abc123          Ocorreu um erro ao fazer login, cheque as credenciais.