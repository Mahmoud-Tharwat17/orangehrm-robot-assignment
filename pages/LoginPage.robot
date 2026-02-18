*** Settings ***
Resource   ../resources/common.robot

*** Keywords ***
Login As
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USER}
    Input Text    ${LOGIN_USER}    ${username}
    Input Password    ${LOGIN_PASS}    ${password}
    Click Button    ${LOGIN_BTN}
    Wait Until Element Is Visible    ${USER_DROPDOWN}    20s

Logout
    Wait Until Element Is Visible    ${USER_DROPDOWN}
    Click Element    ${USER_DROPDOWN}
    Wait Until Element Is Visible    ${LOGOUT_BTN}
    Click Element    ${LOGOUT_BTN}
    Wait Until Element Is Visible    ${LOGIN_BTN}
