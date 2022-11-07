*** Settings ***
Documentation    Documentação da API https://fakerestapi.azurewebsites.net/api/v1/Books

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
Buscar a listage, de todos os livros (GET em todas os livors)
    Requsitar todos os livros
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se retorna uma lista com "200" Livros
Buscar um livro especifico (GET em um livro especifico)
    Requisita o livro "15"
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se o retona todos os dados corretos do livro 15
Cadastrar um novo livro (POST)
    Cadastra um novo livro
    Conferir o status code    200
    Conferir o reason         OK
    Conferir se o retona todos os dados corretos do livro 0