*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Resource          ../Keywords/AddToCart_Keywords.robot
Resource          ../Locators/AddToCart_Locators.robot

*** Test Cases ***
AddToCart1
    Click Apparel Category
    Click Clothing Subcategory
    AddToCart Levi's 511
    Notification Bar expected
    Click ShoppingCart Icon
    Shopping Cart Page Should Be Shown
