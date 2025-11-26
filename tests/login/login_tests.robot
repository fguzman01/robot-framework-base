*** Settings ***
Suite Setup     Abrir Navegador Una Vez
Suite Teardown  Cerrar Navegador

Resource    ../../resources/flows/LoginFlow.robot
Resource    ../../resources/variables/globales.robot
Library     SeleniumLibrary

*** Test Cases ***
Login Fallido
    Realizar Login Fallido    ${EMPTY}    ${PASSWORD_VALIDA}    Epic sadface: Username is required
    
Login Exitoso
    Realizar Login Exitoso    ${USUARIO_VALIDO}    ${PASSWORD_VALIDA}

