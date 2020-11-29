*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/Registration_locators.robot
Resource          ../Resources/Registration_Credentials.robot

*** Keywords ***
Click Register
    Click Link    ${registerLink}

Registration page should appear
    Title Should Be    nopCommerce demo store. Register

Populate Form
    Input Text    ${firstnameLocator}    ${firstNameValue}
    Input Text    ${lastnameLocator}    ${lastNameValue}
    Input Text    ${emailLocator}    ${emailValue}
    Input Text    ${passwordLocator}    ${passwordValue}
    Input Text    ${confirmPasswordLocator}    ${passwordValue}

Submit Form
    Click Button    ${registerButtonLocator}

My Account Link appears
    Element Should Be Enabled    ${myAccountLink}
