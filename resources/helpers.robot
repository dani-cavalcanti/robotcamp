***Settings***
Library         OperatingSystem

***Keywords***
Get Json 
    [Arguments]     ${file_name}

    ${json_file}             Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json_dict}=            Evaluate        json.loads($json_file)       json

    [Return]        ${json_dict}