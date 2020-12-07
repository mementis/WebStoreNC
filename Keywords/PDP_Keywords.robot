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

Click Electronics Cat
    Wait Until Element Is Visible    ${electronicsCat}
    Click Element    ${electronicsCat}

Click CameraPhoto SubCat
    Sleep    3
    Wait Until Element Is Visible    ${cameraAndPhotoSubCat}
    Click Element    ${cameraAndPhotoSubCat}

Click LeicaT
    Sleep    3
    Wait Until Element Is Visible    ${leicaTMirrorlessDC}
    Click Element    ${leicaTMirrorlessDC}

LeicaTPDP displays
    Sleep    3
    Wait Until Element Is Visible    ${leicaTDetailsForm}
    Get WebElement    ${leicaTDetailsForm}

AddReview for LeicaT
    Wait Until Element Is Visible    ${addReviewLeicaT}
    Click Element    ${addReviewLeicaT}

Populate ReviewForm
    Sleep    3
    Wait Until Element Is Visible    ${reviewTitleField}
    Input Text    ${reviewTitleField}    Leica T Lens
    Wait Until Element Is Visible    ${reviewField}
    Input Text    ${reviewField}    Leica T lens are the best
    Wait Until Element Is Visible    ${reviewFormRadioB5}
    Select Radio Button    AddProductReview.Rating    5
    Wait Until Element Is Visible    ${submitReviewButton}
    Click Button    ${submitReviewButton}

Guest Review Not Possible
    Sleep    3
    Wait Until Element Is Visible    ${onlyRegisteredNotification}
    ${reviewError}=    Get Text    ${onlyRegisteredNotification}
    Log    ${reviewError}=
