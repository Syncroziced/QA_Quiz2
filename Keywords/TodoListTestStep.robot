*** Settings ***
Library           SeleniumLibrary  
Resource           ../Keywords/TodoListComponent.robot

*** Keywords ***
#Teststep
Open Web Browser
    [Arguments]     ${URL}=${EMPTY}
    Open Browser    url=${URL}     browser=chrome
    Maximize Browser Window

Switch Tab
    [Documentation]    
    ...   -  ADD ITEM Tab -> Switch Tab    Name=ADD_ITEM 
    ...   -  TO DO TASKS  Tab  -> Switch Tab    Name=TO_DO_TASKS
    ...   -  TO COMPLETED Tab  -> Switch Tab    Name=COMPLETED

    [Arguments]    ${Name}=${EMPTY}
    IF          '${Name}'=='ADD_ITEM'
        Click Element    //a[@href="#add-item"]//span[@data-upgraded=",MaterialRipple"]
    ELSE IF     '${Name}'=='TO_DO_TASKS'
        Click Element    //a[@href="#todo"]//span[@data-upgraded=",MaterialRipple"]
    ELSE IF     '${Name}'=='COMPLETED'
        Click Element    //a[@href="#completed"]//span[@data-upgraded=",MaterialRipple"]
    END 

#ADD ITEM
Create Item
    [Arguments]     ${itemList}=${EMPTY}
    FOR    ${taskName}   IN   @{itemList}    # robotcode: ignore
        Input ItemName        ${taskName}
        Click Button Create Item
    END

#TO DO TASK
Verify ToDoTask
    [Arguments]    ${expectedList}=${EMPTY}   
    ${lenExpectedList}     Get Length        ${expectedList}
    ${index}     Evaluate    0
    FOR    ${taskName}   IN   @{expectedList}    # robotcode: ignore
        ${index}    Evaluate    ${index} + 1
        Log         ${taskName}
        Element Text Should Be     locator=//input[@id="${index}"]/..//span[contains(text(),'${taskName}')]  expected=${taskName}
    END

To Done Task
    [Arguments]    ${expectedDoneList}=${EMPTY}   
    ${lenExpectedList}     Get Length        ${expectedDoneList}
    ${index}     Evaluate    0
    FOR    ${taskName}   IN   @{expectedDoneList}    # robotcode: ignore
        Log         ${taskName}
        Click Element       locator=//label[@for="1"]
        Element Should Not Be Visible   locator=//span[@class='mdl-list__item-primary-content' and contains(text(), '${taskName}')]  
    END

Verify Empty List ToDoTask Tab
    Element Should Not Be Visible    //ul[@id="incomplete-tasks"]//li

#COMPLETED
Verify Completed
    [Arguments]    ${expectedDoneList}=${EMPTY}   
    ${lenExpectedList}     Get Length        ${expectedDoneList}
    ${index}     Evaluate    0
    FOR    ${taskName}   IN   @{expectedDoneList}    # robotcode: ignore
        ${index}    Evaluate    ${index} + 1
        Log         ${taskName}
        Element Text Should Be     locator=//span[@class='mdl-list__item-primary-content' and contains(text(), '${taskName}')]  expected=done${taskName}
    END

Verify Empty List Completed Tab
    Element Should Not Be Visible    //li[@class="mdl-list"]
