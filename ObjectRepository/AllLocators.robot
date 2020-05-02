*** Variables ***
${TEMP_VALUE}    //span[@id='temperature']
${BUY_MOISTURIZERS}    //button[text()='Buy moisturizers']
${MOISTURIZER_TEXT}    //h2[text()='Moisturizers']
${BUT_SUNSCREENS}    //button[text()='Buy sunscreens']
${SUNSCREENS_TEXT}    //h2[text()='Sunscreens']
${CONTAINS_ALOE_COUNT}    //p[contains(text(),'Aloe')]
${CONTAINS_ALOE_PRICE}    (//p[contains(text(),'Aloe')]/following-sibling::p)
${CONTAINS_ALMOND_COUNT}    //p[contains(text(),'almond')]
${CONTAINS_ALMOND_PRICE}    (//p[contains(text(),'almond')]/following-sibling::p)
${CONTAINS_ALOE_NAME}    (//p[contains(text(),'Aloe')])
${ADD_ALOE_BUTTON}    (//p[contains(text(),'Aloe')]/following-sibling::button)
${CONTAINS_ALMOND_NAME}    (//p[contains(text(),'almond')])
${ADD_ALMOND_BUTTON}    (//p[contains(text(),'almond')]/following-sibling::button)
${CONTAINS_SPF50_COUNT}    //p[contains(text(),'SPF-50')]
${CONTAINS_SPF50_PRICE}    (//p[contains(text(),'SPF-50')]/following-sibling::p)
${CONTAINS_SPF30_COUNT}    //p[contains(text(),'SPF-30')]
${CONTAINS_SPF30_PRICE}    (//p[contains(text(),'SPF-30')]/following-sibling::p)
${CONTAINS_SPF50_NAME}    (//p[contains(text(),'SPF-50')])
${ADD_SPF50_BUTTON}    (//p[contains(text(),'SPF-50')]/following-sibling::button)
${CONTAINS_SPF30_NAME}    (//p[contains(text(),'SPF-30')])
${ADD_SPF30_BUTTON}    (//p[contains(text(),'SPF-30')]/following-sibling::button)
${CART_OPTION}    //button[text()='Cart - ']
${CARTPAGE_VERIFY}    //h2[text()='Checkout']
${PAYMENT_BUTTON}    //button[@class='stripe-button-el']/span
${IFRAME_SELECT}    //iframe[@class='stripe_checkout_app'] 
${INPUT_EMAIL}    //input[@type='email']  
${INPUT_CARD_NUMBER}    (//input[@type='tel'])[1]
${INPUT_EXPIRY}    (//input[@type='tel'])[2]
${INPUT_CVV}    (//input[@type='tel'])[3] 
${INPUT_PINCODE}    (//input[@type='tel'])[4]
${PAYMENT_SUBMIT_BUTTON}    //button[@type='submit']/parent::div 
${PAYMENT_SUCCESS_VERIFY}    //h2[text()='PAYMENT SUCCESS']
${GETTING_OTP_PAGE_SKIP}    //span[text()='Fill in your card details manually.']
${PAYMENT_STATUS_TEXT}    //div[@class='row justify-content-center']/h2




 



