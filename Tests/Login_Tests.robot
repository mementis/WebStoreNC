*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Locators/Login_locators.robot
Resource          ../Resources/Login_credentials.robot
Resource          ../Keywords/Login Keywords.robot
Resource          ../Keywords/Homepage Keywords.robot
Library           ExcelRobot

*** Variables ***
${invalid-credentials-error}    //div[contains(@class,'validation-summary-errors')]
${invalid-email-format}    //*[@id="Email-error"]

*** Test Cases ***
Valid Credentials
    [Setup]    Open Homepage
    Steps Login
    Login Title Should be
    Populate Email
    Populate Password
    Submit Login
    Logout Should be Visible
    [Teardown]    Close Browser

Invalid Email
    [Template]
    Open Excel    C:\\Course\\LoginCredentials.xlsx
    ${Email}=    Read Cell Data By Name    Sheet1    A1
    ${Password}=    Read Cell Data By Name    Sheet1    B1
    Login Steps    ${Email}    ${Password}

*** Keywords ***
Login Steps
    [Arguments]    ${Email}    ${Password}
    Click Link    ${loginLink}
    Title Should Be    nopCommerce demo store. Login
    Wait Until Element Is Visible    ${emailLocator}
    Enter Email    ${Email}
    Sleep    4
    Enter Password    ${Password}
    Click Button    ${submitLogin}
    ${emailformat}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${invalid-email-format}
    Run Keyword If    ${emailformat}==False    Wait Until Element Is Visible    ${invalid-credentials-error}

Enter Email
    [Arguments]    ${Email}
    Input Text    ${emailLocator}    ${Email}

Enter Password
    [Arguments]    ${Password}
    Input Text    ${passwordLocator}    ${Password}
