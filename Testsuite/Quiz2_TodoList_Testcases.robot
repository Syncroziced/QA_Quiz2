*** Settings ***
Documentation     Component Test Suite
Library           SeleniumLibrary
Resource          ../Keywords/TodoListTestStep.robot
Test Setup        Open Web Browser    ${URL_WEB_TESTING}
Test Teardown     Close Browser


*** Variables ***
${TASK1}   Register
${TASK2}   Login
${URL_WEB_TESTING}       https://abhigyank.github.io/To-Do-List/


*** Test Cases ***
# Testscenario
TC_Create_2_Tasks_Success
    [Documentation]     Customer create 2 tasks, 2 tasks completed
    VAR  @{expectedList}           ${TASK1}    ${TASK2}
    VAR  @{expectedDoneList}       ${TASK1}    ${TASK2}
    # ADD ITEM
    Create Item         itemList=${expectedList}
    # TO DO TASK
    Switch Tab          Name=TO_DO_TASKS
    Verify ToDoTask     expectedList=${expectedList}
    # TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    Verify Completed    expectedDoneList=${expectedDoneList}

TC_Create_2_Tasks_Delete_TASK1_Success
    [Documentation]     Customer create 2 tasks, ToDoList: task 1 deleted., CompletedList: remain task deleted.
    VAR  @{expectedList}             ${TASK1}    ${TASK2}
    VAR  @{expectedDoneList}         ${TASK2}
    # ADD ITEM
    Create Item         itemList=${expectedList}
    Verify ToDoTask     expectedList=${expectedList}
    # DELETE TASK
    Click Button Delete Item
    Verify ToDoTask     expectedList=${expectedDoneList}
    # TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    Verify Completed    expectedDoneList=${expectedDoneList}
    # DELETE TASK
    Click Button Delete Item

TC_Create_2_Tasks_Delete_TASK2_Success
    [Documentation]     Customer create 2 tasks, ToDoList: task 2 deleted.
    VAR  @{expectedList}             ${TASK1}    ${TASK2}
    VAR  @{expectedDoneList}         ${TASK1}
    # ADD ITEM
    Create Item         itemList=${expectedList}
    Verify ToDoTask     expectedList=${expectedList}
    # DELETE
    Click Button Delete Item    index=2
    Verify ToDoTask     expectedList=${expectedDoneList}
    # TO DONE
    To Done Task        expectedDoneList=${expectedDoneList}
    Verify Completed    expectedDoneList=${expectedDoneList}

TC_Create_1_Tasks_Delete_1_Task_Success
    [Documentation]     Customer create 1 tasks, 1 task deleted.
    VAR   @{expectedList}      ${TASK1}
    # ADD ITEM
    Create Item         itemList=${expectedList}
    Verify ToDoTask     expectedList=${expectedList}
    # DELETE
    Click Button Delete Item
    Verify Empty List ToDoTask Tab
    # Completed
    Verify Empty List Completed Tab

TC_Input_Tasks_itemName_isNotEMPTY
    [Documentation]     Customer input field itemName <> EMPTY, task completed = EMPTY
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
