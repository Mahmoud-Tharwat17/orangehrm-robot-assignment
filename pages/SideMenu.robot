*** Settings ***
Resource   ../resources/common.robot

# this class to navigate between modules
*** Keywords ***
Go To PIM
    Safe Click    ${MENU_PIM}
    Wait Until URL Contains    /pim

Go To Recruitment
    Safe Click    ${MENU_RECRUIT}
    Wait Until URL Contains    /recruitment

Go To Admin
    Safe Click    ${MENU_ADMIN}
    Wait Until URL Contains    /admin
