*** Settings ***
Documentation    API com nome de autrores de livro

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
Usando GET nos autores
    Dado que requeri todos os autores
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E verifico o comprimento da lista de autores

Usendo GET em um autor específico
    Dado que requeri o autor de numero 15
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E faço um requisição pelo Idbook 5

Usando o POST para adicionar o autor 0
    Dado que adicionei o autor 0
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E verifico o autor 0 

Usando PUT para modificar um Autor
    Dado que eu alterei o autor 4
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E verifico o autor 4
Usando o DELETE para apagar um altor
    Dado que eu deletei o altor 0
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E verifico se o autor foi deletado