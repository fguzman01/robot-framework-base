*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/globales.robot

*** Variables ***
# URL del sitio Saucedemo
${LOGIN_URL}              ${BASE_URL}

# Selectores de elementos de la página de login
${USERNAME_FIELD}         id=user-name
${PASSWORD_FIELD}         id=password
${LOGIN_BUTTON}          id=login-button
${ERROR_CONTAINER}        css=h3[data-test="error"]
${ERROR_CLOSE_BUTTON}     css=button[data-test="error-button"]

*** Keywords ***
Abrir Página De Login
    Go To    ${LOGIN_URL}
    Esperar Que La Página De Login Esté Lista

Esperar Que La Página De Login Esté Lista
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}

Ingresar Usuario
    [Arguments]    ${usuario}
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Input Text    ${USERNAME_FIELD}    ${usuario}

Ingresar Contraseña
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}    ${password}

Hacer Click En Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}
    Sleep    5s

Validar Mensaje De Error
    [Arguments]    ${mensaje_esperado}
    Wait Until Element Is Visible    ${ERROR_CONTAINER}    timeout=5s
    ${texto_actual}=    Get Text    ${ERROR_CONTAINER}
    Log    Mensaje de error encontrado: ${texto_actual}
    Element Should Contain           ${ERROR_CONTAINER}    ${mensaje_esperado}

