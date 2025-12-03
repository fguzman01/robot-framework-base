*** Settings ***
Resource    ../pages/InventoryPage.resource
Resource    ../pages/CartPage.resource
Resource    ../flows/LoginFlow.robot
Resource    ../keywords/Navegador.robot
Resource    ../variables/globales.robot
Library     SeleniumLibrary

*** Keywords ***
Agregar Productos
    Agregar Primeros Tres Productos Al Carrito
    Log To Console    ✅ Se agregaron los 3 productos al carrito
    Validar Cantidad En Carrito    3
    Log To Console    ✅ Validación exitosa: Badge del carrito muestra "3"
    Capturar Pantalla Manual    productos_agregados.png

Ir Al Carrito Y Validar
    Abrir Carrito
    Validar Que Cart Esté Lista
    Capturar Pantalla Manual    carrito_abierto.png