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

Conferir se o retona todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${livros.json()}    id    ${BOOK_15.id}
    Dictionary Should Contain Item    ${livros.json()}    title    ${BOOK_15.title}
    Dictionary Should Contain Item    ${livros.json()}    description    ${BOOK_15.description}
    Dictionary Should Contain Item    ${livros.json()}    pageCount    ${BOOK_15.pageCount}
    Dictionary Should Contain Item    ${livros.json()}    excerpt    ${BOOK_15.excerpt}
    Should Not Be Empty    ${livros.json()["publishDate"]}

