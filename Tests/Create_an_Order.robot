*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Homepage Keywords.robot
Library           String

*** Test Cases ***
CreateAnOrder as a Guest
    [Timeout]
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
    Checkout as Guest Form
    Submit CheckoutAsGuest Form
    Shipping Chosen
    Payment Chosen
    Payment Details Confirmed
    Order Confirmation
    Order Should be completed

*** Keywords ***
Select Books Category in Menu
    Click Element    //a[contains(@href, "/books")]

Books PLP Should be
    Title Should Be    nopCommerce demo store. Books

Add Books to Wishlist
    Sleep    7
    Click Button    //div[@data-productid= "37" ]//input[contains(@value,"Add to wishlist")]
    Sleep    7
    Click Button    //div[@data-productid= "39" ]//input[contains(@value,"Add to wishlist")]

Notiffication Appears
    Wait Until Element Is Enabled    //*[@id="bar-notification"]    10
    Element Should Be Enabled    //*[@id="bar-notification"]

Click Wishlist
    Wait Until Element Is Enabled    //a[@href="/wishlist" and @class="ico-wishlist"]    10
    Click Link    //a[@href="/wishlist" and @class="ico-wishlist"]

Wishlist Page Should be
    Title Should Be    nopCommerce demo store. Wishlist

Check Items For Cart
    Wait Until Element Is Enabled    //div[@class="table-wrapper"]    7
    FOR    ${i}    IN RANGE    1    3
        Checkbox Should Not Be Selected    //tr[${i}]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]
        Exit For Loop If    ${i} == 2
        Log    ${i}
    END
    Log    Exited
    Sleep    7
    Select Checkbox    //tr[1]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]
    Wait Until Element Is Enabled    10
    Select Checkbox    //tr[2]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]

Add To Cart
    Sleep    5
    Click Button    //div[@class="buttons"]//input[@type="submit" and @value="Add to cart"]

Shopping Cart Page Should be
    Sleep    5
    Title Should Be    nopCommerce demo store. Shopping Cart

Checkout
    Wait Until Element Is Enabled    //*[@id="termsofservice"]    7s
    Select Checkbox    //*[@id="termsofservice"]
    Wait Until Element Is Enabled    //*[@id="checkout"]    7s
    Click Button    //*[@id="checkout"]

LoginPage Elements Expected
    Wait Until Element Is Enabled    //div[@class="page login-page"]    7
    Wait Until Element Is Enabled    //div[@class="buttons"]//input[@type="button" and @value= ("Checkout as Guest")]    7
    Click Button    //div[@class="buttons"]//input[@type="button" and @value= ("Checkout as Guest")]

Checkout as Guest Form
    #Sleep    10
    Wait Until Element Is Enabled    //*[@id="opc-billing"]    12
    Checkbox Should Be Selected    //*[@id="ShipToSameAddress"]
    Input Text    //*[@id="BillingNewAddress_FirstName"]    Mena
    Input Text    //*[@id="BillingNewAddress_LastName"]    Sivak
    Input Text    //*[@id="BillingNewAddress_Email"]    men_tra@yahoo.com
    Select From List By Value    //*[@id="BillingNewAddress_CountryId"]    1
    Sleep    7
    Select From List By Value    //*[@id="BillingNewAddress_StateProvinceId"]    2
    Input Text    //*[@id="BillingNewAddress_City"]    Austin
    Input Text    //*[@id="BillingNewAddress_Address1"]    3003 Kerbey Ln
    Input Text    //*[@id="BillingNewAddress_ZipPostalCode"]    78702
    Input Text    //*[@id="BillingNewAddress_PhoneNumber"]    2025550130

Submit CheckoutAsGuest Form
    Click Button    //*[@id="billing-buttons-container"]/input

Shipping Chosen
    Wait Until Element Is Enabled    //*[@id="shipping-methods-form"]    7s
    Select Radio Button    shippingoption    Next Day Air___Shipping.FixedByWeightByTotal
    Click Button    //*[@id="shipping-method-buttons-container"]/input

Payment Chosen
    Wait Until Element Is Enabled    //*[@id="checkout-payment-method-load"]    7
    Sleep    7
    Select Radio Button    paymentmethod    Payments.CheckMoneyOrder
    Click Button    //*[@id="payment-method-buttons-container"]/input

Payment Details Confirmed
    Wait Until Element Is Enabled    //*[@id="checkout-payment-info-load"]    7
    Click Button    //*[@id="payment-info-buttons-container"]/input

Order Confirmation
    Wait Until Element Is Enabled    //*[@id="checkout-confirm-order-load"]    7
    Click Button    //*[@id="confirm-order-buttons-container"]/input

Order Should be completed
    Wait Until Element Is Enabled    /html/body/div[6]/div[3]/div/div/div/div[2]    7
    Click Button    /html/body/div[6]/div[3]/div/div/div/div[2]/div/div[3]/input
