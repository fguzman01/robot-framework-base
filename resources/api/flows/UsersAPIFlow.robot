*** Settings ***
Resource    ../endpoints/UsersAPI.resource
Library     Collections

*** Keywords ***
Crear Post Y Validar Respuesta
    [Arguments]    ${title}    ${body}    ${user_id}
    ${json}=    Crear Post    ${title}    ${body}    ${user_id}
    Dictionary Should Contain Value    ${json}    ${title}
    Dictionary Should Contain Value    ${json}    ${body}
    Dictionary Should Contain Value    ${json}    ${user_id}
    RETURN    ${json}

Obtener Post Con Comentarios
    [Arguments]    ${post_id}
    ${post}=    Obtener Post Por ID    ${post_id}
    ${comments}=    Obtener Comentarios Por Post    ${post_id}

    FOR    ${comment}    IN    @{comments}
        Should Be Equal As Integers    ${comment["postId"]}    ${post_id}
    END

    RETURN    ${post}    ${comments}