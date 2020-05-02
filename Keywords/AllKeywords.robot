*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections 
Resource    ../TestData/All_TestData.robot 
Resource    ../ObjectRepository/AllLocators.robot  
       
*** Keywords ***
Launch Application
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Capture Page Screenshot    
    
Get The Temperature
    ${temperatureDegreeValue}    Get Text    ${TEMP_VALUE}
    Log    ${temperatureDegreeValue}
    Capture Page Screenshot        
    [Return]    ${temperatureDegreeValue}
    
Based On Temperature Choose To Buy Sunscreen Or Moisturizer    
    [Arguments]    ${temperatureDegreeValue}            
    @{temperatureValue}    Split String    ${temperatureDegreeValue}     ${EMPTY}
    Log    ${temperatureValue}[0]
    Log    ${temperatureValue}[1]   
    ${selectedOption}     Run Keyword If    ${temperatureValue}[0] < 19    Select Moisturizers
    ...    ELSE    Run Keyword If    ${temperatureValue}[0] > 34    Select Sunscreens
    ...    ELSE    Log    "Temperature Is Equal To Comapring Values"    
    [Return]    ${selectedOption} 

Select Moisturizers
    Click Button    ${BUY_MOISTURIZERS}
    Wait Until Element Is Visible    ${MOISTURIZER_TEXT}
    ${selectedOption}    Get Text    ${MOISTURIZER_TEXT}
    Capture Page Screenshot    
    [Return]    ${selectedOption}      
    
Select Sunscreens 
    Click Button    ${BUT_SUNSCREENS}
    Wait Until Element Is Visible    ${SUNSCREENS_TEXT}
    ${selectedOption}    Get Text    ${SUNSCREENS_TEXT}
    Capture Page Screenshot    
    [Return]    ${selectedOption} 

Based On Option Selected Read Instructions And Add Product Accordingly
    [Arguments]    ${selectedOption} 
    Run Keyword If    '${selectedOption}'=='Moisturizers'    Read Instructions And Add Moisturizers Product Accordingly 
    ...    ELSE    Run Keyword If    '${selectedOption}'=='Sunscreens'    Read Instructions And Add Sunscreens Product Accordingly   
    
Read Instructions And Add Moisturizers Product Accordingly
    ${aloeValueCount}    Get Element Count    ${CONTAINS_ALOE_COUNT}
    @{listAloe}=    Create List
    :FOR    ${i}    IN RANGE    1    ${aloeValueCount}+1    
    \    ${aloePriceTextValue}    Get Text    ${CONTAINS_ALOE_PRICE} [${i}]
    \    @{aloePriceRSValue}    Split String From Right    ${aloePriceTextValue}    ${EMPTY}    1  
    \    Log    ${aloePriceRSValue}[1] 
    \    Append To List    ${listAloe}    ${aloePriceRSValue}[1]
    \    Collections.Sort List    ${listAloe} 
    Add Aloe Minimal Value Product    ${listAloe}    ${aloeValueCount}
          
    ${almondValueCount}    Get Element Count    ${CONTAINS_ALMOND_COUNT}
     @{listAlmond}=    Create List
    :FOR    ${i}    IN RANGE    1    ${almondValueCount}+1    
    \    ${almondPriceTextValue}    Get Text    ${CONTAINS_ALMOND_PRICE} [${i}]
    \    @{almondPriceRSValue}    Split String From Right    ${almondPriceTextValue}    ${EMPTY}    1 
    \    Log    ${almondPriceRSValue}[1]
    \    Append To List    ${listAlmond}    ${almondPriceRSValue}[1]
    \    Collections.Sort List    ${listAlmond} 
    Add Almond Minimal Value Product    ${listAlmond}    ${almondValueCount}                        
 
Add Aloe Minimal Value Product
    [Arguments]    ${listAloe}    ${aloeValueCount}        
    :FOR    ${i}    IN RANGE    1    ${aloeValueCount}+1    
    \    ${aloePriceTextValue}    Get Text    ${CONTAINS_ALOE_PRICE} [${i}]
    \    ${status}    Run Keyword And Return Status    Should Contain    ${aloePriceTextValue}    ${listAloe}[0]
    \    Run Keyword If    '${status}'=='False'    Continue For Loop 
    \    ${aloeProductName}    Get Text    ${CONTAINS_ALOE_NAME} [${i}]   
    \    Click Element    ${ADD_ALOE_BUTTON} [${i}]
    \    Log To Console    ${aloeProductName}
    \    Log To Console    ${listAloe}[0]        
    Capture Page Screenshot                  
    
Add Almond Minimal Value Product
    [Arguments]    ${listAlmond}    ${almondValueCount}
    :FOR    ${i}    IN RANGE    1    ${almondValueCount}+1   
    \    ${almondPriceTextValue}    Get Text    ${CONTAINS_ALMOND_PRICE} [${i}]
    \    ${status}    Run Keyword And Return Status    Should Contain    ${almondPriceTextValue}    ${listAlmond}[0]
    \    Run Keyword If    '${status}'=='False'    Continue For Loop
    \    Click Element    ${ADD_ALMOND_BUTTON} [${i}]
    \    ${almondProductName}    Get Text    ${CONTAINS_ALMOND_NAME} [${i}] 
    \    Log To Console    ${almondProductName}
    \    Log To Console    ${listAlmond}[0]  
    Capture Page Screenshot        
      
Read Instructions And Add Sunscreens Product Accordingly  
    ${spf50ValueCount}    Get Element Count    ${CONTAINS_SPF50_COUNT}
    @{listSPF50}=    Create List
    :FOR    ${i}    IN RANGE    1    ${spf50ValueCount}+1    
    \    ${spf50PriceTextValue}    Get Text    ${CONTAINS_SPF50_PRICE} [${i}]
    \    @{spf50PriceRSValue}    Split String From Right    ${spf50PriceTextValue}    ${EMPTY}    1 
    \    Log    ${spf50PriceRSValue}[1]        
    \    Append To List    ${listSPF50}    ${spf50PriceRSValue}[1]
    \    Collections.Sort List    ${listSPF50} 
    Add SPF50 Minimal Value Product    ${listSPF50}    ${spf50ValueCount}
    
    @{listSPF30}=    Create List 
    ${spf30ValueCount}    Get Element Count    ${CONTAINS_SPF30_COUNT}
    :FOR    ${i}    IN RANGE    1    ${spf30ValueCount}+1    
    \    ${spf30PriceTextValue}    Get Text    ${CONTAINS_SPF30_PRICE} [${i}]
    \    @{spf30PriceRSValue}    Split String From Right    ${spf30PriceTextValue}    ${EMPTY}    1 
    \    Log    ${spf30PriceRSValue}[1]
    \    Append To List    ${listSPF30}    ${spf30PriceRSValue}[1]
    \    Collections.Sort List    ${listSPF30} 
    Add SPF30 Minimal Value Product    ${listSPF30}    ${spf30ValueCount}        
    
Add SPF50 Minimal Value Product
    [Arguments]    ${listSPF50}    ${spf50ValueCount}
    :FOR    ${i}    IN RANGE    1    ${spf50ValueCount}+1    
    \    ${spf50PriceTextValue}    Get Text    ${CONTAINS_SPF50_PRICE} [${i}]
    \    ${status}    Run Keyword And Return Status    Should Contain    ${spf50PriceTextValue}    ${listSPF50}[0]
    \    Run Keyword If    '${status}'=='False'    Continue For Loop
    \    Click Element    ${ADD_SPF50_BUTTON} [${i}]
    \    ${spf50ProductName}    Get Text    ${CONTAINS_SPF50_NAME} [${i}]
    \    Log To Console    ${spf50ProductName}
    \    Log To Console    ${listSPF50}[0]                      
    Capture Page Screenshot        
       
Add SPF30 Minimal Value Product
    [Arguments]    ${listSPF30}    ${spf30ValueCount}
    :FOR    ${i}    IN RANGE    1    ${spf30ValueCount}+1   
    \    ${spf30PriceTextValue}    Get Text    ${CONTAINS_SPF30_PRICE} [${i}]
    \    ${status}    Run Keyword And Return Status    Should Contain    ${spf30PriceTextValue}    ${listSPF30}[0]
    \    Run Keyword If    '${status}'=='False'    Continue For Loop
    \    Click Element    ${ADD_SPF30_BUTTON} [${i}]
    \    ${spf30ProductName}    Get Text    ${CONTAINS_SPF30_NAME} [${i}]
    \    Log To Console    ${spf30ProductName}
    \    Log To Console    ${listSPF30}[0]
    Capture Page Screenshot            
 
# Can Verify Console for both products details with screenshot             
Verify Cart Value    
    Click Button    ${CART_OPTION}
    Wait Until Element Is Visible    ${CARTPAGE_VERIFY}
    Capture Page Screenshot    
                    
Make A Payment
    Click Element    ${PAYMENT_BUTTON}
    Select Frame    ${IFRAME_SELECT}
    Wait Until Keyword Succeeds    ${retry}    ${retryInterval}    Wait Until Element Is Visible    ${INPUT_EMAIL} 
    Capture Page Screenshot         
    Input Text    ${INPUT_EMAIL}     ${emailValue}
    # Used below 2 lines just to ignore the otp page i am getting after entering new email. This doesnot effect anything.
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${GETTING_OTP_PAGE_SKIP}
    Run Keyword And Ignore Error    Click Element    ${GETTING_OTP_PAGE_SKIP}
    #                
    Input Text    ${INPUT_CARD_NUMBER}    ${cardNumberValue}
    Input Text    ${INPUT_EXPIRY}    ${month/yearValue} 
    Input Text    ${INPUT_CVV}    ${cvvValue}
    Input Text    ${INPUT_PINCODE}    ${pincodeValue}
    Capture Page Screenshot    
    Click Element    ${PAYMENT_SUBMIT_BUTTON}
    Capture Page Screenshot       
    Wait Until Element Is Visible    ${PAYMENT_STATUS_TEXT}
    ${paymentStatus}    Get Text    ${PAYMENT_STATUS_TEXT}
    Run Keyword If    '${paymentStatus}'=='PAYMENT SUCCESS'    Log    "Payment Successful"
    ...    ELSE    Log    "Payment Failed"             
    Capture Page Screenshot                                      

Close Application   
    Close Browser    
    
    
    
    
    
    
    
    
    






