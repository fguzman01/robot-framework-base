*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${API_BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Crear Sesion API
    Create Session    jsonplaceholder    ${API_BASE_URL}

Obtener Lista De Posts
    Crear Sesion API
    ${response}=    GET On Session    jsonplaceholder    /posts
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Obtener Post Por ID
    [Arguments]    ${post_id}
    Crear Sesion API
    ${response}=    GET On Session    jsonplaceholder    /posts/${post_id}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Obtener Comentarios Por Post
    [Arguments]    ${post_id}
    Crear Sesion API
    ${response}=    GET On Session    jsonplaceholder    /comments    params=postId=${post_id}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}

Crear Post
    [Arguments]    ${title}    ${body}    ${user_id}
    Crear Sesion API
    &{payload}=    Create Dictionary    title=${title}    body=${body}    userId=${user_id}
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${payload}
    Status Should Be    201    ${response}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${json}