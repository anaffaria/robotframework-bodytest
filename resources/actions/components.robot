*** Settings ***
Documentation            Ações  de componentes genéricos
Library    Browser

*** Keywords ***
Toaster Text Should Be
    [Arguments]     ${expected_text}

    Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}    visible     5

Alert Text Should Be 
    [Arguments]     ${expected_text}

     Wait For Elements State      css=form span >> text=${expected_text}     visible     5

Get Required Alerts
    [Arguments]     ${index}

    ${span}         Get Text        xpath=(//form//span)[${index}]

    [return]        ${span} 


Field Should Be Type
    [Arguments]        ${element}            ${type}
    
    ${attr}             Get Attribute        ${element}       type
    Should Be Equal     ${attr}              ${type}

Register Should Not Be Found
    [Arguments]                  ${register}

    Wait For Elements State      css=div >> text=${register}     visible     5

Total Items Should Be 
    [Arguments]        ${number}
    
    ${element}        Set Variable     css=#pagination .total   

    Wait For Elements State    ${element}    visible     5
    Get Text                   ${element}    ==     Total: ${number}        

Toaster Error Text Should be
    [Arguments]                 ${expect_text}
    Wait For Elements State     css=.Toastify__toast--error >> text=${expect_text}       visible     5  
