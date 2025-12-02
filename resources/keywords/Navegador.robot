*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Resource   ../variables/globales.robot

*** Keywords ***
Abrir Navegador Una Vez
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --disable-save-password-bubble
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --no-first-run
    Open Browser    ${BASE_URL}    chrome    options=${chrome_options}
    Maximize Browser Window

Cerrar Navegador
    Close Browser

Capturar Pantalla Manual
    [Arguments]    ${nombre}=None
    Run Keyword If    '${nombre}' == 'None'    Capture Page Screenshot
    ...               ELSE    Capture Page Screenshot    ${nombre}