*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/PDP_Locators.robot

*** Keywords ***
Click Asus N551
    Sleep    2
    Wait Until Element Is Visible    ${asusN551Loc}
    Click Element    ${asusN551Loc}

AsusPDP displays
    Sleep    2
    Wait Until Element Is Visible    ${asusN551DetailsForm}
    Get WebElement    ${asusN551DetailsForm}
