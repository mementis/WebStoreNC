*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Resource          ../Keywords/Registration_Keywords.robot
Resource          ../Locators/Registration_locators.robot
Resource          ../Resources/Registration_Credentials.robot

*** Test Cases ***
Register with Valid Credentials
    Click Register
    Registration page should appear
    Populate Form
    Submit Form
    My Account Link appears
