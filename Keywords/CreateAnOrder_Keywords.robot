*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/CreateAnOrder_Locators.robot
Resource          ../Resources/LandingPages_TestData.robot

*** Keywords ***
Select Books Category in Menu
    Click Element    ${booksCatLocator}

Books PLP Should be
    Title Should Be    ${booksPLPTitle}

Add Books to Wishlist
    Wait Until Element Is Visible    ${Fahrenheit451AddToWishlist}
    ${book1}=    Get WebElement    ${Fahrenheit451AddToWishlist}
    Sleep    2
    Click Element    ${book1}
    #Notiffication Appears
    #Sleep    5
    #Wait Until Element Is Visible    //*[@id="bar-notification"]
    #Element Should Be Visible    //*[@id="bar-notification"]

Click Wishlist
    Sleep    5
    Wait Until Element Is Visible    ${wishlistIconLocator}
    Click Link    ${wishlistIconLocator}

Wishlist Page Should be
    Title Should Be    ${WishlistPageTittle}

Check Items For Cart
    Wait Until Element Is Visible    ${wishlistTableLocator}
    Wait Until Element Is Visible    ${addToCartCheckboxLoc1}
    ${wishlist1}=    Get WebElement    ${addToCartCheckboxLoc1}
    Sleep    2
    Select Checkbox    ${wishlist1}

Add To Cart
    Sleep    5
    Click Button    ${addToCartButtonLocator}

Shopping Cart Page Should be
    Sleep    5
    Title Should Be    ${ShoppingCartPageTittle}

Checkout
    Wait Until Element Is Visible    ${termsOfServiceCheckbox}
    Select Checkbox    ${termsOfServiceCheckbox}
    Wait Until Element Is Visible    ${checkoutButton}
    Click Button    ${checkoutButton}

LoginPage Elements Expected
    Wait Until Element Is Visible    ${pageLoginPage}
    Wait Until Element Is Visible    ${checkoutAsGuestButton}
    ${CheckoutAsGuest}=    Get WebElement    ${checkoutAsGuestButton}
    Sleep    2
    Click Button    ${CheckoutAsGuest}

Checkout as Guest Form
    Wait Until Element Is Visible    ${billingForm}
    Checkbox Should Be Selected    ${shipToSameAddressCheckbox}
    Sleep    3
    Wait Until Element Is Visible    ${billingFirstNameField}
    Input Text    ${billingFirstNameField}    Mena
    Wait Until Element Is Visible    ${billingLastNameField}
    Input Text    ${billingLastNameField}    Sivak
    Wait Until Element Is Visible    ${billingEmailField}
    Input Text    ${billingEmailField}    mena_tra@yahoo.com
    Wait Until Element Is Visible    ${billingCountrySelect}
    Select From List By Value    ${billingCountrySelect}    1
    Sleep    7
    Select From List By Value    ${billingStateSelect}    2
    Wait Until Element Is Visible    ${billingCityField}
    Input Text    ${billingCityField}    Austin
    Wait Until Element Is Visible    ${billingAddress1Field}
    Input Text    ${billingAddress1Field}    3003 Kerbey Ln
    Wait Until Element Is Visible    ${billingPostcodeField}
    Input Text    ${billingPostcodeField}    78702
    Wait Until Element Is Visible    ${billingPhoneNumberField}
    Input Text    ${billingPhoneNumberField}    2025550130

Submit CheckoutAsGuest Form
    Wait Until Element Is Visible    ${CheckoutAsGuestSUbmitButton}
    Click Button    ${CheckoutAsGuestSUbmitButton}

Shipping Method Chosen
    Wait Until Element Is Visible    ${shippingMethodsForm}
    Select Radio Button    shippingoption    Next Day Air___Shipping.FixedByWeightByTotal
    Click Button    ${shippingMethodContinueButton}

Payment Method Chosen
    Wait Until Element Is Visible    ${CheckoutPaymentMethodLoad}
    Sleep    3
    Select Radio Button    paymentmethod    Payments.CheckMoneyOrder
    Click Button    ${paymentMethodContinueButton}

Payment Info Confirmed
    Wait Until Element Is Visible    ${CheckoutPaymentInfoLoad}
    Wait Until Element Is Visible    ${paymentInfoConitueButton}
    Click Button    ${paymentInfoConitueButton}

Order Confirmation
    Wait Until Element Is Visible    ${CheckoutConfirmOrderLoad}
    Wait Until Element Is Visible    ${confirmOrderButton}
    Click Button    ${confirmOrderButton}

Order Should be completed
    Wait Until Element Is Visible    ${CheckoutOrderData}
    Wait Until Element Is Visible    ${orderCompletedContinueButton}
    Click Button    ${orderCompletedContinueButton}

Homepage Expected
    Title Should Be    ${HomePageTittle}
