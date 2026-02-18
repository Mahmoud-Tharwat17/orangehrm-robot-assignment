*** Settings ***
Resource   ../resources/common.robot
*** Variables ***
${Hiring_role}    xpath=//div[@role='listbox']//span
${first_role}    xpath=(//div[@role='listbox']//span)[1]
${Vacany_header}        xpath=//*[self::h6 or self::h5][normalize-space(.)="Add Vacancy"]
${Recruitment_header}                xpath=//h6[normalize-space(.)="Recruitment"]
${VACANCY_CELL_TPL}    xpath=//div[contains(@class,"orangehrm-vacancy-list") and @role="table"]//div[normalize-space(.)="%VACANCY%"]
*** Keywords ***
Open Vacancies
    # Recruitment module header
    Wait Until Page Contains Element    ${Recruitment_header}    20s
    Wait Until Element Is Visible       ${RECRUIT_VACANCIES_TAB}    20s
    Safe Click    ${RECRUIT_VACANCIES_TAB}
    # Vacancies page marker (Add button exists on list view)

    Wait Until Element Is Visible       ${ADD_BTN}    20s

Open Candidates

    Wait Until Element Is Visible       ${RECRUIT_CANDIDATES_TAB}    20s
    Safe Click    ${RECRUIT_CANDIDATES_TAB}

    Wait Until Element Is Visible       ${ADD_BTN}    20s

Create Vacancy
    [Arguments]    ${vacancy_name}    ${hiring_manager}    ${positions}=1
    # Precondition: Vacancies list view

    Safe Click    ${ADD_BTN}


    ${url}=    Get Location
    Log To Console    After clicking Add, URL = ${url}

    Wait Until Page Contains Element    ${Vacany_header}    20s
    Log To Console    Add Vacancy header is visible
    Wait Until Element Is Visible    ${VACANCY_NAME_INPUT}    20s
    Safe Click                  ${VACANCY_NAME_INPUT}
    Input Text    ${VACANCY_NAME_INPUT}    ${vacancy_name}

    Safe Click    ${JOB_TITLE_DDL}
    Select First Option From Open Dropdown

    # Hiring Manager is an autocomplete: type, then pick first suggestion
    Input Text    ${HIRING_MANAGER_INPUT}   ${hiring_manager}
    Wait Until Page Contains Element    ${Hiring_role}   20s
    Safe Click    ${first_role}

    Input Text    ${NUM_POSITIONS}    ${positions}

    Safe Click    ${SAVE_BTN}


#Validate new vacancy is created

# Because toast message sometimes dismissed in this module created a different validaion flow: Candidates -> Vacancies -> filter Vacancy -> Search -> assert result

Validate new vacancy is created
    [Arguments]    ${vacancy_name}
    Safe Click    ${RECRUIT_CANDIDATES_TAB}
    Wait Until Element Is Visible    ${RECRUIT_CANDIDATES_TAB}    10s
    Safe Click    ${RECRUIT_VACANCIES_TAB}
    Wait Until Element Is Visible    ${RECRUIT_VACANCY_FILTER_DDL}    20s

    ${cell}=    Replace String    ${VACANCY_CELL_TPL}    %VACANCY%    ${vacancy_name}
    Wait Until Keyword Succeeds    10x    1s    Page Should Contain Element    ${cell}


# create candidate and assert on the success message
Add Candidate
    [Arguments]    ${first}    ${last}    ${email}
    # Precondition: Candidates list view

    Safe Click    ${ADD_BTN}

    Wait Until Element Is Visible    ${CAND_FIRSTNAME}    20s
    Input Text    ${CAND_FIRSTNAME}    ${first}
    Input Text    ${CAND_LASTNAME}     ${last}
    Input Text    ${CAND_EMAIL}        ${email}
    Safe Click    ${SAVE_BTN}
    Wait For Toast Success
