*** Settings ***
Suite Setup     Suite Setup Inventory
Suite Teardown  Cerrar Navegador

Resource    ../../resources/flows/InventoryFlow.robot
Resource    ../../resources/flows/LoginFlow.robot
Resource    ../../resources/variables/globales.robot
Resource    ../../resources/keywords/Navegador.robot
Library     SeleniumLibrary

*** Keywords ***
Suite Setup Inventory
    Abrir Navegador Una Vez
    Realizar Login Exitoso    ${USUARIO_VALIDO}    ${PASSWORD_VALIDA}

*** Test Cases ***
Agregar Productos Y Validar Badge
    Agregar Productos
    Ir Al Carrito Y Validar
    Sleep    5s    # Pausa para debug - ver el estado del carrito