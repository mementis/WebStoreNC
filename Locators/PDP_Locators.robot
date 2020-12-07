*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${asusN551Loc}    //a[@href="/asus-n551jk-xo076h-laptop" and text()="Asus N551JK-XO076H Laptop"]
${asusN551DetailsForm}    //*[@id="product-details-form" and @action="/asus-n551jk-xo076h-laptop"]
${electronicsCat}    //a[@href="/electronics" and text()= "Electronics "]
${cameraAndPhotoSubCat}    //a[@href="/camera-photo" and @title="Show products in category Camera & photo"]
${leicaTMirrorlessDC}    //a[@href="/leica-t-mirrorless-digital-camera" and text()="Leica T Mirrorless Digital Camera"]
${leicaTDetailsForm}    //*[@id="product-details-form" and @action="/leica-t-mirrorless-digital-camera"]
${addReviewLeicaT}    //a[@href="/productreviews/16" and text()="Add your review"]
${reviewTitleField}    //*[@id="AddProductReview_Title"]
${reviewField}    //*[@id="AddProductReview_ReviewText"]
${reviewFormRadioB5}    //*[@id="addproductrating_5"]
${submitReviewButton}    //*[@id="review-form"]/form/div[2]/input
${onlyRegisteredNotification}    //*[@id="review-form"]/form/div[@class="message-error validation-summary-errors"]
