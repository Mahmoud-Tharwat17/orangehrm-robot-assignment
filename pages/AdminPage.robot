*** Settings ***
Resource   ../resources/common.robot
*** Variables ***
${admin_header}                   xpath=//h6[normalize-space(.)="Admin"]
${admin_dropdowns}                xpath=//div[@role='listbox']//span
#can  be more dynamic
${select_ESS}                     xpath=//div[@role='listbox']//span[normalize-space(.)='ESS'] 
#can be more dynamic
${dropDown_first_element}         xpath=(//div[@role='listbox']//span)[1]   
${roles_list}                     xpath=//div[@role='listbox']  
${Select_status}                  xpath=//div[@role='listbox']//span[normalize-space(.)='Enabled']
*** Keywords ***
Create System User (ESS)
    [Arguments]    ${employee_name}    ${new_username}    ${new_password}
    Wait Until Page Contains Element    ${admin_header}    20s
    Safe Click    ${ADMIN_ADD_BTN}

    Wait Until Element Is Visible    ${USER_ROLE_DDL}    20s
    Safe Click    ${USER_ROLE_DDL}
    Wait Until Element Is Visible        ${admin_dropdowns}     10s
    ${ok}=    Run Keyword And Return Status    Safe Click    ${select_ESS}
    Run Keyword If    not ${ok}    Safe Click    ${dropDown_first_element}

    Input Text    ${EMP_NAME_ADMIN}    ${employee_name}
    Wait Until Page Contains Element    ${admin_dropdowns}    20s
    Safe Click    ${dropDown_first_element} 

    Safe Click    ${STATUS_DDL}
    Wait Until Element Is Visible    ${roles_list}   10s
    ${ok2}=   Run Keyword And Return Status    Safe Click    ${Select_status}
    Run Keyword If    not ${ok2}    Safe Click   ${dropDown_first_element} 

    Input Text        ${SYS_USERNAME}      ${new_username}
    Input Password    ${SYS_PASSWORD}      ${new_password}
    Input Password    ${SYS_CONFIRM_PASS}  ${new_password}
    Safe Click    ${SAVE_BTN}
    Wait For Toast Success


