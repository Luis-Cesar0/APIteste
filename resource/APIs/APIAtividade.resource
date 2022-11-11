*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_Activ}    https://fakerestapi.azurewebsites.net/api/v1/Activities

*** Keywords ***
Dado que tenha requerido todas as atividades
    ${ACTIV}    Get  ${URL_Activ}
    Log    ${ACTIV.text}
    Set Test Variable    ${ACTIV}

Quando verificar o satutus code sera de ${code}
    Should Be Equal As Strings  ${ACTIV.status_code}       ${code}

E o reason é "${reason}"
    Should Be Equal As Strings    ${ACTIV.reason}     ${reason}

E se foi retornado uma lista com "${comprimento}" Atividades
    Length Should Be    ${Activ.json()}    ${comprimento}