*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${asusN551Loc}    //a[@href="/asus-n551jk-xo076h-laptop" and text()="Asus N551JK-XO076H Laptop"]
${asusN551DetailsForm}    //*[@id="product-details-form" and @action="/asus-n551jk-xo076h-laptop"]
