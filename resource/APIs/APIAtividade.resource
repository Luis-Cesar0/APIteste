*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${URL_Activ}    https://fakerestapi.azurewebsites.net/api/v1/Activities

&{ativ_3}       id=3
...             title=Activity 3
...             completed=False

&{ativ_31}      "id"=31
...             "title"=String
...             "completed"=true

&{ativ_1}       "id"=0
...             "title"=string
...             "completed"=true


*** Keywords ***
Dado que tenha requerido todas as atividades
    ${ACTIV}    Get    ${URL_Activ}
    Log    ${ACTIV.text}
    Set Test Variable    ${ACTIV}

Quando verifico o satutus code sera de ${code}
    Should Be Equal As Strings    ${ACTIV.status_code}    ${code}

E o reason é "${reason}"
    Should Be Equal As Strings    ${ACTIV.reason}    ${reason}

E se foi retornado uma lista com "${comprimento}" Atividades
    Length Should Be    ${Activ.json()}    ${comprimento}

Dado que foi requerido a atividade ${num}
    ${ACTIV}    Get    ${URL_Activ}/${num}
    Log    ${ACTIV.text}
    Set Test Variable    ${ACTIV}

E verifico se foi retonado a atividade "${num}"
    Dictionary Should Contain Key    ${ACTIV.json()}    id           ${ativ_${num}.id}
    Dictionary Should Contain Item    ${ACTIV.json()}    title        ${ativ_${num}.title}
    Dictionary Should Contain Key    ${ACTIV.json()}    completed    ${ativ_${num}.completed}
    Should Not Be Empty    ${ACTIV.json()["dueDate"]}

Dado que foi postado a atividade 31
    ${ACTIV}    POST    ${URL_Activ}    json=&{ativ_31}
    Log    ${ACTIV.text}
    Set Test Variable    ${ACTIV}

Dado que fui altera a atividade ${Id_Ativ}
    ${ACTIV}    PUT    ${URL_Activ}/${Id_Ativ}    json=&{ativ_1}
    Log    ${ACTIV.text}
    Set Task Variable    ${ACTIV}

Dado que foi deletado a atividade ${num_ATIV}
    ${ACTIV}    DELETE    ${URL_Activ}/${num_ATIV}
    Log    ${ACTIV.text}
    Set Task Variable    ${ACTIV}

E verifico se a atividadeee ${num_ATVI} foi deletada
    Should Be Empty    ${ACTIV.content}
