*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${booksCatLocator}    //a[contains(@href, "/books")]
${Fahrenheit451AddToWishlist}    //div[@data-productid= "37" ]//input[contains(@value,"Add to wishlist")]
${wishlistIconLocator}    //a[@href="/wishlist" and @class="ico-wishlist"]
${wishlistTableLocator}    //div[@class="table-wrapper"]
${addToCartCheckboxLoc1}    //tr[1]//td[@class="add-to-cart"]//input[@type="checkbox" and @name="addtocart"]
${addToCartButtonLocator}    //div[@class="buttons"]//input[@type="submit" and @value="Add to cart"]
${termsOfServiceCheckbox}    //*[@id="termsofservice"]
${checkoutButton}    //*[@id="checkout"]
${pageLoginPage}    //div[@class="page login-page"]
${checkoutAsGuestButton}    //div[@class="buttons"]/input[@type="button" and @value="Checkout as Guest"]
${billingForm}    //*[@id="opc-billing"]
${shipToSameAddressCheckbox}    //*[@id="ShipToSameAddress"]
${billingFirstNameField}    //*[@id="BillingNewAddress_FirstName"]
${billingLastNameField}    //*[@id="BillingNewAddress_LastName"]
${billingEmailField}    //*[@id="BillingNewAddress_Email"]
${billingCountrySelect}    //*[@id="BillingNewAddress_CountryId"]
${billingStateSelect}    //*[@id="BillingNewAddress_StateProvinceId"]
${billingCityField}    //*[@id="BillingNewAddress_City"]
${billingAddress1Field}    //*[@id="BillingNewAddress_Address1"]
${billingPostcodeField}    //*[@id="BillingNewAddress_ZipPostalCode"]
${billingPhoneNumberField}    //*[@id="BillingNewAddress_PhoneNumber"]
${CheckoutAsGuestSUbmitButton}    //*[@id="billing-buttons-container"]/input
${shippingMethodsForm}    //*[@id="shipping-methods-form"]
${shippingMethodContinueButton}    //*[@id="shipping-method-buttons-container"]/input
${CheckoutPaymentMethodLoad}    //*[@id="checkout-payment-method-load"]
${paymentMethodContinueButton}    //*[@id="payment-method-buttons-container"]/input
${CheckoutPaymentInfoLoad}    //*[@id="checkout-payment-info-load"]
${paymentInfoConitueButton}    //*[@id="payment-info-buttons-container"]/input
${CheckoutConfirmOrderLoad}    //*[@id="checkout-confirm-order-load"]
${confirmOrderButton}    //*[@id="confirm-order-buttons-container"]/input
${CheckoutOrderData}    //div[@class="page-body checkout-data"]/div[@class="section order-completed"]
${orderCompletedContinueButton}    //div[@class="buttons"]//input[@type="button" and @class="button-1 order-completed-continue-button"]
