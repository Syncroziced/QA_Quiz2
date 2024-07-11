*** Settings ***
Documentation     Component ToDoList
Library           SeleniumLibrary
*** Keywords ***
Input ItemName
    [Documentation]  Input to textfield 'ItemName'
    [Arguments]     ${Name}=${EMPTY}
    Wait Until Element Is Enabled       locator=//input[@id="new-task"]
    Input Text      locator=//input[@id="new-task"]          text=${Name}

Click Button Create Item
    [Documentation]  Click Button for Add item to 'To Do List'
    Wait Until Element Is Enabled        locator=//button[@data-upgraded=",MaterialButton"]
    Click Button        locator=//button[@data-upgraded=",MaterialButton"]

Click Button Delete Item
    [Documentation]  Click Button for Delete Item
    [Arguments]     ${index}=1
    Wait Until Element Is Enabled        locator=//button[@id="${index}"]
    Click Button        locator=//button[@id="${index}"]
