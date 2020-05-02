*** Settings ***  
Resource    ../Keywords/AllKeywords.robot        

*** Test Cases ***
Record Temperature And Make Payment After Selecting Sanitizer
    Launch Application
    ${temperatureDegreeValue}    Get The Temperature
    ${selectedOption}     Based On Temperature Choose To Buy Sunscreen Or Moisturizer    ${temperatureDegreeValue}
    Based On Option Selected Read Instructions And Add Product Accordingly    ${selectedOption} 
    Verify Cart Value
    Make A Payment
    Close Application    