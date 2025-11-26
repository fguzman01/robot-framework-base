*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Selectores de elementos de la página Inventory
${INVENTORY_TITLE}        css=.title
${SWAG_LABS_LOGO}         css=.app_logo

*** Keywords ***
Esperar Que Inventory Esté Lista
    Wait Until Element Is Visible    ${INVENTORY_TITLE}
    Element Text Should Be           ${INVENTORY_TITLE}    Products