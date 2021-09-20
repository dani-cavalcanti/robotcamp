***Settings***
Documentation       Representação da página equipamentos com seus elementos e ações

***Variables***
${EQUIPOS_FORM}         css:a[href$='/equipos/register']
${LABEL_EQ_NAME}        css:label[for=equipo-name]
${LABEL_EQ_PRICE}       css:label[for=daily_price]

***Keywords***
Register New Equipo
    [Arguments]         ${eq_name}      ${eq_price}

    Wait Until Element Is Not Visible                           ${TOASTER_ERROR}     5
    Input Text                                                  id:equipo-name              ${eq_name}
    Input Text                                                  id:daily_price              ${eq_price}
    Click Element                                               xpath://button[text()='CADASTRAR']
    
    