*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Resource          ../Keywords/PLP_Keywords.robot
Resource          ../Locators/PLP_Locators.robot

*** Test Cases ***
Is FIlter Working
    Click Computers Cat
    Click Notebooks Subcat
    Filter Notebooks
    Select All Filtered
