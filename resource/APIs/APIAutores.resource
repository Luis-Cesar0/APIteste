*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_AUTO}    https://fakerestapi.azurewebsites.net/api/v1/Authors
${book_URL}    https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books

${Autor_15}    id=15
...            idBook=5
...            firstName=First Name 15
...            lastName=Last Name 15
*** Keywords ***
Dado que requeri todos os autores
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

Dado que requeri o autor de numero ${num_auto}
    ${AUTOR}    GET    ${URL_AUTO}/${num_auto}
    Log    ${AUTOR}
    Set Test Variable    ${AUTOR}

E faço um requisição pelo Idbook ${ID_Book}
    ${BOOK}    GET    ${book_URL}/${ID_Book}
    Log    ${BOOK}
    Set Test Variable    ${BOOK}

        