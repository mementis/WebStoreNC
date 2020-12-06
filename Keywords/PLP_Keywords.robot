*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Click Computers Cat
    Click Element    ${computersCatLocator}

Click Notebooks Subcat
    Sleep    3
    Wait Until Element Is Visible    ${notebooksSubCatLocator}
    Click Element    ${notebooksSubCatLocator}

Filter Notebooks
    Sleep    3
    Wait Until Element Is Visible    ${i5FilterLoc}
    Click Link    ${i5FilterLoc}
    Wait Until Element Is Visible    ${i5IndicatorLoc}
    Sleep    3
    Wait Until Element Is Visible    ${8GBFilterLoc}
    Click Link    ${8GBFilterLoc}
    Sleep    5
    Wait Until Element Is Visible    ${8GBIndicatorLoc}

Select All Filtered
    ${products}=    Get WebElements    ${allListedLoc}
    Log    ${products}
    ${count} =    Get Element Count    ${allListedLoc}
    Should Be True    ${count} < 2
