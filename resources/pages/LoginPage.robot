***Settings***
Documentation       Representação da página de login com suas ações e elementos


***Keywords***
Login With
    [Arguments]     ${email}        ${password}

    Input Text          id:txtEmail                         ${email}
    Input Text          css:input[placeholder=Senha]        ${password}
    Click ELement       xpath://button[text()='Entrar']

