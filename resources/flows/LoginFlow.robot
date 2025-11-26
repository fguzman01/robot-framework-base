*** Settings ***
Resource    ../pages/LoginPage.resource
Resource    ../pages/InventoryPage.resource
Resource    ../variables/globales.robot
Resource    ../keywords/Navegador.robot
Library     SeleniumLibrary    run_on_failure=Capture Page Screenshot

*** Keywords ***
Realizar Login Exitoso
    [Arguments]    ${usuario}    ${password}
    Abrir Página De Login
    Ingresar Usuario        ${usuario}
    Ingresar Contraseña     ${password}
    Hacer Click En Login
    Esperar Que Inventory Esté Lista

Realizar Login Fallido
    [Arguments]    ${usuario}    ${password}    ${mensaje_esperado}
    Abrir Página De Login
    Ingresar Usuario        ${usuario}
    Ingresar Contraseña     ${password}
    Hacer Click En Login
    Validar Mensaje De Error    ${mensaje_esperado}