*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${apparelCategory}    //div[@class="header-menu"]//ul[@class="top-menu notmobile"]//a[@href="/apparel"]
${clothingSubcat}    //div[@class="sub-category-item"]//h2[@class="title"]//a[@href="/clothing"]
${addToCartLevis}    //div[@class="product-item" and @data-productid="30"]//input[@type="button" and @class="button-2 product-box-add-to-cart-button"]
${ATCNotificationBar}    //*[@id="bar-notification"]
${shoppingCartIcon}    //*[@id="topcartlink"]/a
