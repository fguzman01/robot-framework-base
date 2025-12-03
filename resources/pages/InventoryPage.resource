*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Selectores de elementos de la página Inventory
${INVENTORY_TITLE}        css=.title
${SWAG_LABS_LOGO}         css=.app_logo

# Selector del icono del carrito
${CART_ICON}    css=a.shopping_cart_link

# Selector del badge de cantidad del carrito
${CART_BADGE}    css=span.shopping_cart_badge

# Lista de botones "Add to cart" de los productos visibles en la página
@{ADD_TO_CART_BUTTONS}
...    css=button[data-test="add-to-cart-sauce-labs-backpack"]
...    css=button[data-test="add-to-cart-sauce-labs-bike-light"]
...    css=button[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]

*** Keywords ***
Esperar Que Inventory Esté Lista
    Wait Until Element Is Visible    ${INVENTORY_TITLE}
    Element Text Should Be           ${INVENTORY_TITLE}    Products

Abrir Carrito
    Log To Console    🛒 Abriendo carrito de compras...
    Wait Until Element Is Visible    ${CART_ICON}
    Click Element    ${CART_ICON}
    Log To Console    ✅ Carrito abierto exitosamente

Agregar Primeros Tres Productos Al Carrito
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTONS}[0]
    Click Element                    ${ADD_TO_CART_BUTTONS}[0]

    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTONS}[1]
    Click Element                    ${ADD_TO_CART_BUTTONS}[1]

    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTONS}[2]
    Click Element                    ${ADD_TO_CART_BUTTONS}[2]

Validar Cantidad En Carrito
    [Arguments]    ${cantidad_esperada}
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be           ${CART_BADGE}    ${cantidad_esperada}