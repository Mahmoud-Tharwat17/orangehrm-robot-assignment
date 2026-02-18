*** Settings ***
Resource   ../resources/common.robot
Resource   ../pages/LoginPage.robot
Resource   ../pages/SideMenu.robot
Resource   ../pages/PIMPage.robot
Resource   ../pages/RecruitmentPage.robot
Resource   ../pages/AdminPage.robot

Suite Setup      Open App
Suite Teardown   Close App
Test Teardown    Capture Screenshot On Failure

*** Variables ***
${CREATED_EMP_ID}      NONE
${CREATED_EMP_NAME}    NONE

*** Test Cases ***
TC01 Create Employee in PIM [smoke]
    [Tags]    smoke
    Login As    ${ADMIN_USER}    ${ADMIN_PASS}
    Go To PIM
    ${first}=    Generate Unique    First
    ${last}=     Generate Unique    Last
    ${emp_id}=   Create Employee    ${first}    ${last}
    Set Suite Variable    ${CREATED_EMP_ID}      ${emp_id}
    Set Suite Variable    ${CREATED_EMP_NAME}    ${first} ${last}
    Should Not Be Empty    ${CREATED_EMP_ID}

TC02 Search For Created Employee [regression]
    [Tags]    regression
    Go To PIM
    Open Employee List
    Search Employee By Id    ${CREATED_EMP_ID}
    Verify Employee Exists In List    ${CREATED_EMP_ID}


TC03 Create Vacancy In Recruitment [smoke]
    [Tags]    smoke
    Go To Recruitment
    Open Vacancies
    ${vac}=    Generate Unique    ${VACANCY_NAME_PREFIX}
    Create Vacancy    ${vac}    ${CREATED_EMP_NAME}    1
    Validate new vacancy is created    ${vac}

TC04 Add Candidate In Recruitment [regression]
    [Tags]    regression
    Go To Recruitment
    Open Candidates
    ${email_user}=    Generate Unique    candidate
    ${email}=         Catenate    SEPARATOR=@    ${email_user}    ${CAND_EMAIL_DOMAIN}
    Add Candidate     CandidateFirst    CandidateLast    ${email}

TC05 Create System User And Login [smoke]
    [Tags]    smoke
    Go To Admin
    ${new_user}=    Generate Unique    qa_user
    ${new_pass}=    Set Variable    123@Mm@567
    Create System User (ESS)    ${CREATED_EMP_NAME}    ${new_user}    ${new_pass}
    Logout
    Login As    ${new_user}    ${new_pass}
