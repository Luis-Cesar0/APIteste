*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_APIBook}    https://fakerestapi.azurewebsites.net/api/v1/Books
&{BOOK_15}     id=15
...            title=Book 15
...            description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...            pageCount=1500
...            excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

&{BOOK_0}      id=0
...            title=Book 0
...            description=teste
...            pageCount=0
...            excerpt=Teste

&{BOOk_4}      id=4
...            title=Book 4
...            description=altera
...            pageCount=4
...            excerpt=altera

*** Keywords ***
Requsitar todos os livros
    ${livros}    GET    ${URL_APIBook}
    Log    ${livros.text}
    Set Test Variable    ${livros}

requisita o livro "${ID_Livro}"
    ${livros}    GET    ${URL_APIBook}/${ID_Livro}
    Log    ${livros.text}
    Set Test Variable    ${livros}

Conferir o status code
    [Arguments]   ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings     ${livros.status_code}        ${STATUSCODE_DESEJADO}

Conferir o reason 
    [Arguments]   ${REASON_DESEJADO}
    Should Be Equal As Strings     ${livros.reason}        ${REASON_DESEJADO}

Conferir se retorna uma lista com "${comprimento}" Livros
    Length Should Be    ${livros.json()}    ${comprimento}

Conferir se o retona todos os dados corretos do livro ${numero}
    Dictionary Should Contain Key    ${livros.json()}    id             ${BOOK_${numero}.id}
    Dictionary Should Contain Item    ${livros.json()}    title          ${BOOK_${numero}.title}
    Dictionary Should Contain Item    ${livros.json()}    description    ${BOOK_${numero}.description}
    Dictionary Should Contain Key    ${livros.json()}    pageCount      ${BOOK_${numero}.pageCount}
    Dictionary Should Contain Item    ${livros.json()}    excerpt        ${BOOK_${numero}.excerpt}
    Should Not Be Empty    ${livros.json()["publishDate"]}

Cadastra um novo livro
    ${livros}   POST    ${URL_APIBook}    json=&{BOOK_0}
    Log    ${livros.text}
    Set Test Variable    ${livros}

alterando o livro ${id_Livro}
    ${livros}    PUT    ${URL_APIBook}/${id_Livro}    json=&{BOOK_4}
    Log    ${livros.text}
    Set Test Variable    ${livros}

Deletando o livro "${ID_livro}"
    ${livros}    DELETE    ${URL_APIBook}/${ID_livro}
    Log    ${livros.text}
    Set Test Variable    ${livros}
    
Conferindo se o elemento ${ID_livro} foi deletado
    Should Be Empty   ${livros.content}  
    

    