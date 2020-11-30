*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Library           String

*** Test Cases ***
CreateAnOrder as a Guest
    Select Books Category in Menu
    Books PLP Should be
    Add Books to Wishlist
    Notiffication Appears
    Click Wishlist
    Wishlist Page Should be
    Check Items For Cart
    Add To Cart
    Shopping Cart Page Should be
    Checkout
    LoginPage Elements Expected

*** Keywords ***
Select Books Category in Menu
    Click Element    //a[contains(@href, "/books")]

Books PLP Should be
    Title Should Be    nopCommerce demo store. Books

Add Books to Wishlist
    Sleep    5
    Click Button    //div[@data-productid= "37" ]//input[contains(@value,"Add to wishlist")]
    Sleep    5
    Click Button    //div[@data-productid= "39" ]//input[contains(@value,"Add to wishlist")]
    Sleep    5

Notiffication Appears
    Wait Until Element Is Enabled    //*[@id="bar-notification"]
    Element Should Be Enabled    //*[@id="bar-notification"]

Click Wishlist
    Wait Until Element Is Enabled    //a[@href="/wishlist" and @class="ico-wishlist"]
    Click Link    //a[@href="/wishlist" and @class="ico-wishlist"]

Wishlist Page Should be
    Title Should Be    nopCommerce demo store. Wishlist

Check Items For Cart
    Wait Until Element Is Enabled    //div[@class="table-wrapper"]
    FOR    ${i}    IN RANGE    1    3
        Checkbox Should Not Be Selected    //tr[${i}]//td[2]//input[@type="checkbox" and @name="addtocart"]
        Exit For Loop If    ${i} == 2
        Log    ${i}
    END
    Log    Exited
    Select Checkbox    //tr[1]//td[2]//input[@type="checkbox" and @name="addtocart"]
    Sleep    5
    Select Checkbox    //tr[1]//td[2]//input[@type="checkbox" and @name="addtocart"]

Add To Cart
    Sleep    5
    Click Button    //div[@class="buttons"]//input[@type="submit" and @value="Add to cart"]

Shopping Cart Page Should be
    Sleep    5
    Title Should Be    nopCommerce demo store. Shopping Cart
    #Items Should Be Listed
    #Submit Shopping Cart
    #Click Element    //*[@id="shopping-cart-form"]/div[2]/div[1]/input[2]

Checkout
    Select Checkbox    //*[@id="termsofservice"]
    Click Button    //*[@id="checkout"]

LoginPage Elements Expected
    Page Should Contain Element    //div[@class="buttons"]/input[@class="button-1 checkout-as-guest-button" and @value="Checkout as Guest"]
    Click Element    //div[@class="buttons"]/input[@class="button-1 checkout-as-guest-button" and @value="Checkout as Guest"]
