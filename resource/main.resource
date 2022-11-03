*** Settings ***
Documentation    Arquivpo principal

Resource    ../resource/pages/APIBooks.resource

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/

*** Keywords ***
conctar a minha API
    Create Session    FakeAPI    ${URL_API}    