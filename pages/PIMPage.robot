*** Settings ***
Resource   ../resources/common.robot

*** Variables ***
${employee_header}        xpath=//h6[normalize-space(.)="PIM"]
${target_employee_tpl}    xpath=//div[contains(@class,'oxd-table-body')]//*[contains(normalize-space(.),"%EMP_ID%")]

*** Keywords ***
# create employee and assert on success message then get emp_id to use in the upcoming keywords
Create Employee
    [Arguments]    ${first}    ${last}
    Wait Until Page Contains Element    ${employee_header}   20s
    Wait Until Element Is Visible       ${PIM_ADD_BTN}    20s
    Safe Click    ${PIM_ADD_BTN}
    Wait Until Element Is Visible    ${EMP_FIRSTNAME}    20s
    Input Text    ${EMP_FIRSTNAME}    ${first}
    Input Text    ${EMP_LASTNAME}     ${last}
    ${emp_id}=    Get Value    ${EMP_ID}
    Safe Click    ${SAVE_BTN}
    Wait For Toast Success
    RETURN    ${emp_id}


Open Employee List
    Wait Until Page Contains Element    ${employee_header}    20s
    Wait Until Element Is Visible    ${PIM_EMP_LIST_TAB}    20s
    Safe Click    ${PIM_EMP_LIST_TAB}
    Wait Until Element Is Visible    ${EMP_SEARCH_ID}    20s

# find created employee by employee ID if yes test passed
Search Employee By Id
    [Arguments]    ${emp_id}
    Clear Element Text    ${EMP_SEARCH_ID}
    Input Text    ${EMP_SEARCH_ID}    ${emp_id}
    Safe Click    ${SEARCH_BTN}
    Wait Until Element Is Visible    ${EMP_TABLE_BODY}    20s

Verify Employee Exists In List
    [Arguments]    ${emp_id}
    ${locator}=    Replace String    ${target_employee_tpl}    %EMP_ID%    ${emp_id}
    Page Should Contain Element    ${locator}
    Sleep    5S

