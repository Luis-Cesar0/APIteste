*** Settings ***
Documentation    Documentação da API https://fakerestapi.azurewebsites.net/api/v1/Activities

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
usando GET nas atividades
    Dado que tenha requerido todas as atividades
    Quando verificar o satutus code sera de 200
    E o reason é "OK"
    E se foi retornado uma lista com "30" Atividades