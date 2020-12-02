*** Settings ***
Library           SeleniumLibrary
Resource          AddToCart_Keywords.robot
Resource          ../Locators/AddToCart_Locators.robot

*** Keywords ***
Click Apparel Category
    Click Element    ${apparelCategory}

Click Clothing Subcategory
    Wait Until Element Is Visible    ${clothingSubcat}
    Click Element    ${clothingSubcat}

AddToCart Levi's 511
    Wait Until Element Is Enabled    ${addToCartLevis}    10
    Click Button    ${addToCartLevis}

Notification Bar expected
    Element Should Be Enabled    ${ATCNotificationBar}

Click ShoppingCart Icon
    Click Link    ${shoppingCartIcon}

Shopping Cart Page Should Be Shown
    Title Should Be    nopCommerce demo store. Shopping Cart
