*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/Login_locators.robot
Resource          ../Resources/Login_credentials.robot
Resource          ../Keywords/Login Keywords.robot
Resource          ../Keywords/Homepage Keywords.robot

*** Test Cases ***
Login With Valid Credentials
    [Setup]    Open Homepage
    Click Login
    Login Title Should be
    Populate Email
    Populate Password
    Submit Login
    Logout Should be Visible
    [Teardown]    Close Browser
