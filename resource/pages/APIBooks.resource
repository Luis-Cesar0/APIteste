*** Settings ***

Library    RequestsLibrary
Library    collections

*** Variables ***
${URL_APIBook}    https://fakerestapi.azurewebsites.net/api/v1/Books

*** Keywords ***
Requsitar todos os livros
    ${livros}    GET    ${URL_APIBook}
    Log    ${livros.text}