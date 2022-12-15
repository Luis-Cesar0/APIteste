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

&{Autor_0}    id=0
...           idBook=0
...           firstName="string"
...           lastName="string

&{Autor_4}    id=4
...           idBook=0
...           firstName="string"
...           lastName="string

*** Keywords ***
Dado que requeri todos os autores
    ${AUTOR}    Get     ${URL_AUTO}
    Log    ${AUTOR.text}
    Set Test Variable    ${AUTOR}

Quando o status code for verificado,retorna ${code}
    Should Be Equal As Strings    ${AUTOR.status_code}    ${code}

E o reason deve retorna "${reason}"
    Should Be Equal As Strings    ${AUTOR.reason}    ${reason}

E verifico o comprimento da lista de autores
    ${comprimento}     Get Length   ${AUTOR.json()}  
    Log  ${comprimento} 

Dado que requeri o autor de numero ${num_auto}
    ${AUTOR}    GET    ${URL_AUTO}/${num_auto}
    Log    ${AUTOR.text}
    Set Test Variable    ${AUTOR}

E faço um requisição pelo Idbook ${ID_Book}
    ${BOOK}    GET    ${book_URL}/${ID_Book}
    Log    ${BOOK.text}
    Set Test Variable    ${BOOK}

Dado que adicionei o autor ${autor}
    ${AUTOR}    POST    ${URL_AUTO}    json=&{Autor_${autor}}
    Log    ${AUTOR.text}
    Set Test Variable    ${AUTOR}

E verifico o autor ${autor_num}
    Dictionary Should Contain Item    ${AUTOR.json()}    id           ${Autor_${autor_num}.id}
    Dictionary Should Contain Item    ${AUTOR.json()}    idBook       ${Autor_${autor_num}.idBook}
    Dictionary Should Contain Item    ${AUTOR.json()}    firstName    ${Autor_${autor_num}.firstName}
    Dictionary Should Contain Item    ${AUTOR.json()}    lastName     ${Autor_${autor_num}.lastName}

Dado que eu alterei o autor ${id_Autor}
    ${AUTOR}    PUT    ${URL_AUTO}/${id_Autor}    json=&{Autor_4}
    Log    ${AUTOR.text}
    Set Test Variable    ${AUTOR}

Dado que eu deletei o altor ${ID-delete}
    ${AUTOR}    DELETE    ${URL_AUTO}/${ID-delete}
    Log    ${AUTOR.text}
    Set Test Variable    ${AUTOR}

E verifico se o autor foi deletado
    Should Be Empty    ${AUTOR.content}