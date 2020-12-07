*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Resource          ../Keywords/PLP_Keywords.robot
Resource          ../Locators/PLP_Locators.robot
Resource          ../Keywords/PDP_Keywords.robot
Resource          ../Locators/PDP_Locators.robot
Resource          ../Locators/Login_locators.robot
Resource          ../Keywords/Login Keywords.robot
Resource          ../Locators/Login_locators.robot
Resource          ../Resources/Login_credentials.robot

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

WriteSubmit_Review_LogedIn
    Login As User
    Click Electronics Cat
    Click CameraPhoto SubCat
    Click LeicaT
    LeicaTPDP displays
    AddReview for LeicaT
    Populate ReviewForm
    Verify LeicaT Review

*** Keywords ***
Login As User
    Click Login
    Login Title Should be
    Populate Email
    Populate Password
    Submit Login
    Logout Should be Visible

Verify LeicaT Review
    Sleep    3
    Wait Until Element Is Visible    //div[@class="page product-reviews-page"]//div[@class="page-body"]//div[@class="result" ]
    ${reviewLeica}=    Get Text    //div[@class="page product-reviews-page"]//div[@class="page-body"]//div[@class="result" ]
    Log    ${reviewLeica}
