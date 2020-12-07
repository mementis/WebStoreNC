*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Resource          ../Keywords/PLP_Keywords.robot
Resource          ../Locators/PLP_Locators.robot
Resource          ../Keywords/PDP_Keywords.robot
Resource          ../Locators/PDP_Locators.robot

*** Test Cases ***
Open_PDP
    Click Computers Cat
    Click Notebooks Subcat
    Click Asus N551
    AsusPDP displays
