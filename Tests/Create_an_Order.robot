*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary    timeout=10
Resource          ../Keywords/Homepage Keywords.robot
Library           String
Resource          ../Keywords/CreateAnOrder_Keywords.robot

*** Test Cases ***
CreateAnOrder as a Guest
    [Timeout]
    Select Books Category in Menu
    Books PLP Should be
    Add Books to Wishlist
    Click Wishlist
    Wishlist Page Should be
    Check Items For Cart
    Add To Cart
    Shopping Cart Page Should be
    Checkout
    LoginPage Elements Expected
    Checkout as Guest Form
    Submit CheckoutAsGuest Form
    Shipping Method Chosen
    Payment Method Chosen
    Payment Info Confirmed
    Order Confirmation
    Order Should be completed
