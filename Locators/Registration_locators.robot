*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${registerLink}    //a[contains(@href, "/register?returnUrl=%2F" ) ]
${firstnameLocator}    //*[@id="FirstName"]
${lastnameLocator}    //*[@id="LastName"]
${emailLocator}    //*[@id="Email"]
${passwordLocator}    //*[@id="Password"]
${confirmPasswordLocator}    //*[@id="ConfirmPassword"]
${registerButtonLocator}    //*[@id="register-button"]
${myAccountLink}    //a[contains(@href, "/customer/info") ]
