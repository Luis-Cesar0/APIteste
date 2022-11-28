*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_AUTO}    https://fakerestapi.azurewebsites.net/api/v1/Authors
*** Keywords ***
Dado que eu requeri todos os autores
    ${AUTOR}    Get     ${URL_AUTO}
    Log    ${AUTOR}
    Set Test Variable    ${AUTOR}

Quando o status code for verificado,retorna ${code}
    Should Be Equal As Strings    ${AUTOR.status_code}    ${code}

E o reason deve retorna "${reason}"
    Should Be Equal As Strings    ${AUTOR.reason}    ${reason}

E verifico o comprimento da lista de autores
    ${comprimento}     Get Length   ${AUTOR.json()}  
    Log To Console    ${comprimento}  

