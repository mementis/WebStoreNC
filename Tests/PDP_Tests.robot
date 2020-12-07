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

WriteAndSubmit_Review_AsAGuest
    Click Electronics Cat
    Click CameraPhoto SubCat
    Click LeicaT
    LeicaTPDP displays
    AddReview for LeicaT
    Guest Review Not Possible
