*** Settings ***
Library           SeleniumLibrary 
Test Setup        Open Web Browser    ${URL_WEB_TESTING}
Test Teardown     Close Browser
Resource          ../Keywords/TodoListTestStep.robot

*** Variables ***
${Task1}   Register
${Task2}   Login
${EMPTY_TASK}   ${EMPTY}
${URL_WEB_TESTING}       https://abhigyank.github.io/To-Do-List/


*** Test Cases ***
#Testscenario
TC_Create_2_Tasks_Success
    [Documentation]     Customer create 2 tasks, 2 tasks completed    
    ${expectedList}        Create List     ${Task1}    ${Task2}
    ${expectedDoneList}    Create List     ${Task1}    ${Task2}
    ##ADD ITEM
    Create Item         itemList=${expectedList}
    ##TO DO TASK
    Switch Tab          Name=TO_DO_TASKS
    Verify ToDoTask     expectedList=${expectedList}
    #TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    ###Completed
    Switch Tab          Name=COMPLETED
    Verify Completed    expectedDoneList=${expectedDoneList}


TC_Create_2_Tasks_Delete_Task1_Success
    [Documentation]     Customer create 2 tasks, task 1 deleted.
    ${expectedList}        Create List     ${Task1}    ${Task2}
    ${expectedDoneList}    Create List     ${Task2}
    ##ADD ITEM
    Create Item         itemList=${expectedList}
    ##TO DO TASK
    Switch Tab          Name=TO_DO_TASKS
    Verify ToDoTask     expectedList=${expectedList}
    #DELETE
    Click Button Delete Item
    Verify ToDoTask     expectedList=${expectedDoneList}
    #TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    ###Completed
    Switch Tab          Name=COMPLETED
    Verify Completed    expectedDoneList=${expectedDoneList}


TC_Create_2_Tasks_Delete_Task2_Success
    [Documentation]     Customer create 2 tasks, task 2 deleted.
    ${expectedList}        Create List     ${Task1}    ${Task2}
    ${expectedDoneList}    Create List     ${Task1}
    ##ADD ITEM
    Create Item         itemList=${expectedList}
    ##TO DO TASK
    Switch Tab          Name=TO_DO_TASKS
    Verify ToDoTask     expectedList=${expectedList}
    #DELETE
    Click Button Delete Item    index=2
    Verify ToDoTask     expectedList=${expectedDoneList}
    #TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    ###Completed
    Switch Tab          Name=COMPLETED
    Verify Completed    expectedDoneList=${expectedDoneList}


TC_Create_1_Tasks_Delete_1_Task_Success
    [Documentation]     Customer create 1 tasks, 1 task deleted.
    ${expectedList}        Create List     ${Task1}
    ##ADD ITEM
    Create Item         itemList=${expectedList}
    ##TO DO TASK
    Switch Tab          Name=TO_DO_TASKS
    Verify ToDoTask     expectedList=${expectedList}
    #DELETE
    Click Button Delete Item
    Verify Empty List ToDoTask Tab
    ###Completed
    Switch Tab          Name=COMPLETED
    Verify Empty List Completed Tab


TC_Input_Tasks_itemName_isNotEMPTY
    [Documentation]     Customer input field itemName <> EMPTY, task completed = EMPTY
    ${expectedList}    Create List     ${Task1}
    Input ItemName
    Verify Empty List ToDoTask Tab
    Verify Empty List Completed Tab


TC_Input_Tasks_itemName_isEMPTY
    [Documentation]     Customer input field itemName = EMPTY, task completed = EMPTY
    Verify Empty List ToDoTask Tab
    Verify Empty List Completed Tab


TC_Create_Tasks_itemName_isEMPTY
    [Documentation]     Customer create task itemName = EMPTY, task completed = EMPTY
    Click Button Create Item
    Verify Empty List ToDoTask Tab
    Verify Empty List Completed Tab





