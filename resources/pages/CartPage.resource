*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Selectores de elementos de la página Cart
${CART_TITLE}        css=span[data-test="title"]
${CHECKOUT_BUTTON}   css=button[data-test="checkout"]

*** Keywords ***
Validar Que Cart Esté Lista
    Log To Console    🛒 Validando página del carrito...
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Text Should Be           ${CART_TITLE}    Your Cart
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    Element Should Be Enabled        ${CHECKOUT_BUTTON}
    Log To Console    ✅ Página del carrito lista - Título y botón Checkout validados