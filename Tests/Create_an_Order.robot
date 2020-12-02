*** Settings ***
Suite Setup       Open Homepage
Suite Teardown    Close Browser
Library           SeleniumLibrary    timeout=10
Resource          ../Keywords/Homepage Keywords.robot
Library           String

*** Test Cases ***
CreateAnOrder as a Guest
    [Timeout]
    Select Books Category in Menu
    Books PLP Should be
    Add Books to Wishlist
    #Notiffication Appears
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

*** Keywords ***
Select Books Category in Menu
    Click Element    //a[contains(@href, "/books")]

Books PLP Should be
    Title Should Be    nopCommerce demo store. Books

Add Books to Wishlist
    Wait Until Element Is Visible    //div[@data-productid= "37" ]//input[contains(@value,"Add to wishlist")]
    ${book1}=    Get WebElement    //div[@data-productid= "37" ]//input[contains(@value,"Add to wishlist")]
    Sleep    2
    Click Element    ${book1}
    #Notiffication Appears
    #Sleep    5
    #Wait Until Element Is Visible    //*[@id="bar-notification"]
    #Element Should Be Visible    //*[@id="bar-notification"]

Click Wishlist
    Sleep    5
    Wait Until Element Is Visible    //a[@href="/wishlist" and @class="ico-wishlist"]
    Click Link    //a[@href="/wishlist" and @class="ico-wishlist"]

Wishlist Page Should be
    Title Should Be    nopCommerce demo store. Wishlist

Check Items For Cart
    Wait Until Element Is Visible    //div[@class="table-wrapper"]
    Wait Until Element Is Visible    //tr[1]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]
    ${wishlist1}=    Get WebElement    //tr[1]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]
    Sleep    2
    Select Checkbox    ${wishlist1}

Add To Cart
    Sleep    5
    Click Button    //div[@class="buttons"]//input[@type="submit" and @value="Add to cart"]

Shopping Cart Page Should be
    Sleep    5
    Title Should Be    nopCommerce demo store. Shopping Cart

Checkout
    Wait Until Element Is Visible    //*[@id="termsofservice"]
    Select Checkbox    //*[@id="termsofservice"]
    Wait Until Element Is Visible    //*[@id="checkout"]
    Click Button    //*[@id="checkout"]

LoginPage Elements Expected
    Wait Until Element Is Visible    //div[@class="page login-page"]
    Wait Until Element Is Visible    //div[@class="buttons"]/input[@type="button" and @value="Checkout as Guest"]
    ${CheckoutAsGuest}=    Get WebElement    //div[@class="buttons"]/input[@type="button" and @value="Checkout as Guest"]
    Sleep    2
    Click Button    ${CheckoutAsGuest}

Checkout as Guest Form
    Wait Until Element Is Visible    //*[@id="opc-billing"]
    Checkbox Should Be Selected    //*[@id="ShipToSameAddress"]
    Sleep    3
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_FirstName"]
    Input Text    //*[@id="BillingNewAddress_FirstName"]    Mena
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_LastName"]
    Input Text    //*[@id="BillingNewAddress_LastName"]    Sivak
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_Email"]
    Input Text    //*[@id="BillingNewAddress_Email"]    mena_tra@yahoo.com
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_CountryId"]
    Select From List By Value    //*[@id="BillingNewAddress_CountryId"]    1
    Sleep    7
    Select From List By Value    //*[@id="BillingNewAddress_StateProvinceId"]    2
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_City"]
    Input Text    //*[@id="BillingNewAddress_City"]    Austin
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_Address1"]
    Input Text    //*[@id="BillingNewAddress_Address1"]    3003 Kerbey Ln
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_ZipPostalCode"]
    Input Text    //*[@id="BillingNewAddress_ZipPostalCode"]    78702
    Wait Until Element Is Visible    //*[@id="BillingNewAddress_PhoneNumber"]
    Input Text    //*[@id="BillingNewAddress_PhoneNumber"]    2025550130

Submit CheckoutAsGuest Form
    Wait Until Element Is Visible    //*[@id="billing-buttons-container"]/input
    Click Button    //*[@id="billing-buttons-container"]/input

Shipping Method Chosen
    Wait Until Element Is Visible    //*[@id="shipping-methods-form"]
    Select Radio Button    shippingoption    Next Day Air___Shipping.FixedByWeightByTotal
    Click Button    //*[@id="shipping-method-buttons-container"]/input

Payment Method Chosen
    Wait Until Element Is Visible    //*[@id="checkout-payment-method-load"]
    Sleep    3
    Select Radio Button    paymentmethod    Payments.CheckMoneyOrder
    Click Button    //*[@id="payment-method-buttons-container"]/input

Payment Info Confirmed
    Wait Until Element Is Visible    //*[@id="checkout-payment-info-load"]
    Wait Until Element Is Visible    //*[@id="payment-info-buttons-container"]/input
    Click Button    //*[@id="payment-info-buttons-container"]/input

Order Confirmation
    Wait Until Element Is Visible    //*[@id="checkout-confirm-order-load"]
    Wait Until Element Is Visible    //*[@id="confirm-order-buttons-container"]/input
    Click Button    //*[@id="confirm-order-buttons-container"]/input

Order Should be completed
    Wait Until Element Is Visible    //div[@class="page-body checkout-data"]/div[@class="section order-completed"]
    Wait Until Element Is Visible    //div[@class="buttons"]//input[@type="button" and @class="button-1 order-completed-continue-button"]
    Click Button    //div[@class="buttons"]//input[@type="button" and @class="button-1 order-completed-continue-button"]

Homepage Expected
    Title Should Be    nopCommerce demo store
