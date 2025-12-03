*** Settings ***
Resource    ../../resources/api/flows/UsersAPIFlow.robot
Library     SeleniumLibrary

*** Test Cases ***
Crear Post Y Validarlo
    Log To Console    🔄 Iniciando creación de post via API...
    ${json}=    Crear Post Y Validar Respuesta    Mi Titulo    Mi Contenido    1
    Log To Console    ✅ Post creado correctamente con ID: ${json['id']}
    Log To Console    ✅ Título validado: '${json['title']}'
    Log To Console    ✅ Contenido validado: '${json['body']}'
    Log To Console    ✅ Usuario ID validado: ${json['userId']}
    Log To Console    🎯 Test API completado exitosamente

Validar Post Con Comentarios
    ${post}    ${comments}=    Obtener Post Con Comentarios    1
    Log To Console    Post obtenido: ${post}
    Log To Console    Comentarios obtenidos: ${comments}