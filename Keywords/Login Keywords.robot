*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/Login_locators.robot
Resource          ../Resources/Login_credentials.robot

*** Keywords ***
Click Login
    Click Link    ${loginLink}

Login Title Should be
    Sleep    3
    Title Should Be    nopCommerce demo store. Login

Populate Email
    Input Text    ${emailLocator}    ${validEmail}

Populate Password
    Input Text    ${passwordLocator}    ${validPassword}

Submit Login
    Click Button    ${submitLogin}

Logout Should be Visible
    Sleep    5
    Element Should Be Enabled    ${logoutLink}
