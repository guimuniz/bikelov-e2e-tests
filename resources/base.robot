*** Settings ***
Library     SeleniumLibrary
Library           OperatingSystem

Resource    elements.robot

*** Variables ***
${BASE_URL}     https://bikelov-anunciante.herokuapp.com

*** Keywords ***
Start Session
    Create Webdriver                Chrome    executable_path=/Users/guilhermecastro/.wdm/chromedriver/80.0.3987.106/mac64/chromedriver
    Go To                           about:blank
    Set Window Size                 1440    900
    Set Selenium Implicit Wait      5

End Session
    Close Browser

Logged with "${email}"
    Start Session
    Go To      ${BASE_URL}

    Input Text          ${INPUT_EMAIL}       ${email}
    Click Element       ${BUTTON_LOGIN}

    Page Should Contain Element     ${DIV_DASH}

End Test
    Capture Page Screenshot