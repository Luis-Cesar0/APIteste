*** Settings ***
Documentation    Documentação da API https://fakerestapi.azurewebsites.net/api/v1/Activities

Resource    ../resource/main.resource

Suite Setup    conctar a minha API

*** Test Cases ***
usando GET nas atividades
    Dado que tenha requerido todas as atividades
    Quando verifico o satutus code sera de 200
    E o reason é "OK"
    E se foi retornado uma lista com "30" Atividades
usando GET em uma atividade específica
    Dado que foi requerido a atividade 3
    Quando verifico o satutus code sera de 200
    E o reason é "OK"
    E verifico se foi retonado a atividade 3

usando o POST numa atividade
    Dado que foi postado a atividade 31
    Quando verifico o satutus code sera de 200
    E o reason é "OK"
   

usando o PUT numa atividade
    Dado que fui altera a atividade 1
    Quando verifico o satutus code sera de 200
    E o reason é "OK"

Usando o DELET
    Dado que foi deletado a atividade 6
    Quando verifico o satutus code sera de 200
    E o reason é "OK"
    E verifico se a atividadeee 6 foi deletada 
