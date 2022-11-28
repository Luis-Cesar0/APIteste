*** Settings ***
Documentation    API com nome de autrores de livro

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
usando GET nos autores
    Dado que eu requeri todos os autores
    Quando o status code for verificado,retorna 200
    E o reason deve retorna "OK"
    E verifico o comprimento da lista de autores

 