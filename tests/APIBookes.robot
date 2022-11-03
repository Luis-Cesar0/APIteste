*** Settings ***
Documentation    Documentação da API https://fakerestapi.azurewebsites.net/api/v1/Books

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
Buscar a listage, de todos os livros (GET em todas os livors)
    Requsitar todos os livros