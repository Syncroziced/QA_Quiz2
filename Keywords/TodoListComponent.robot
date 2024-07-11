*** Settings ***
Library           SeleniumLibrary  

*** Keywords ***
#ItemName
Input ItemName
    [Arguments]     ${Name}=${EMPTY}
    Wait Until Element Is Enabled       locator=//input[@id="new-task"]
    Input Text      locator=//input[@id="new-task"]          text=${Name}

Click Button Create Item
    Wait Until Element Is Enabled        locator=//button[@data-upgraded=",MaterialButton"]
    Click Button        locator=//button[@data-upgraded=",MaterialButton"]

Click Button Delete Item
    [Arguments]     ${index}=1
    Wait Until Element Is Enabled        locator=//button[@id="${index}"]
    Click Button        locator=//button[@id="${index}"]
