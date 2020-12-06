*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${computersCatLocator}    //a[contains(@href, "/computers")]
${notebooksSubCatLocator}    //div[@class="sub-category-item"]//h2[@class="title"]//a[@href="/notebooks"]
${i5FilterLoc}    //a[@href="https://demo.nopcommerce.com/notebooks?specs=6" and text()=" Intel Core i5 "]
${8GBFilterLoc}    //a[@href="https://demo.nopcommerce.com/notebooks?specs=6,9" and text()= " 8 GB "]
${i5IndicatorLoc}    //div[@class="filtered-items"]//li[@class="item" and text()=": Intel Core i5"]/strong[text()="CPU Type"]
${8GBIndicatorLoc}    //div[@class="filtered-items"]//li[@class="item" and text()=": 8 GB"]/strong[text()="Memory"]
${allListedLoc}    //div[@class="product-item"]
