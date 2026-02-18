# Keyword Reference (Documentation-only)

This file documents each **custom Robot Framework keyword** (Project keywords under `resources/` and `pages/`) to explain the intent and flow.

> Note: Per request, **no `.robot` files were modified**. This documentation serves as the “comment on each keyword” deliverable.

## pages/AdminPage.robot

### `Create System User (ESS)`
**Arguments:** `${employee_name}`, `${new_username}`, `${new_password}`
**Logic (step-by-step):**
- Wait until page contains element ${admin_header} (timeout 20s).
- Click ${ADMIN_ADD_BTN} (uses the project’s safe click wrapper).
- Wait until element ${USER_ROLE_DDL} is visible (timeout 20s).
- Click ${USER_ROLE_DDL} (uses the project’s safe click wrapper).
- Wait until element ${admin_dropdowns} is visible (timeout 10s).
- ${ok}=    Run Keyword And Return Status    Safe Click    ${select_ESS}
- Conditionally run: Run Keyword If    not ${ok}    Safe Click    ${dropDown_first_element}
- Type ${employee_name} into ${EMP_NAME_ADMIN}.
- Wait until page contains element ${admin_dropdowns} (timeout 20s).
- Click ${dropDown_first_element} (uses the project’s safe click wrapper).
- Click ${STATUS_DDL} (uses the project’s safe click wrapper).
- Wait until element ${roles_list} is visible (timeout 10s).
- ${ok2}=   Run Keyword And Return Status    Safe Click    ${Select_status}
- Conditionally run: Run Keyword If    not ${ok2}    Safe Click   ${dropDown_first_element}
- Type ${new_username} into ${SYS_USERNAME}.
- Input Password    ${SYS_PASSWORD}      ${new_password}
- Input Password    ${SYS_CONFIRM_PASS}  ${new_password}
- Click ${SAVE_BTN} (uses the project’s safe click wrapper).
- Wait For Toast Success

## pages/LoginPage.robot

### `Login As`
**Arguments:** `${username}`, `${password}`
**Logic (step-by-step):**
- Wait until element ${LOGIN_USER} is visible (timeout default).
- Type ${username} into ${LOGIN_USER}.
- Input Password    ${LOGIN_PASS}    ${password}
- Click Button    ${LOGIN_BTN}
- Wait until element ${USER_DROPDOWN} is visible (timeout 20s).

### `Logout`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Wait until element ${USER_DROPDOWN} is visible (timeout default).
- Click Element    ${USER_DROPDOWN}
- Wait until element ${LOGOUT_BTN} is visible (timeout default).
- Click Element    ${LOGOUT_BTN}
- Wait until element ${LOGIN_BTN} is visible (timeout default).

## pages/PIMPage.robot

### `Create Employee`
**Arguments:** `${first}`, `${last}`
**Logic (step-by-step):**
- Wait until page contains element ${employee_header} (timeout 20s).
- Wait until element ${PIM_ADD_BTN} is visible (timeout 20s).
- Click ${PIM_ADD_BTN} (uses the project’s safe click wrapper).
- Wait until element ${EMP_FIRSTNAME} is visible (timeout 20s).
- Type ${first} into ${EMP_FIRSTNAME}.
- Type ${last} into ${EMP_LASTNAME}.
- ${emp_id}=    Get Value    ${EMP_ID}
- Click ${SAVE_BTN} (uses the project’s safe click wrapper).
- Wait For Toast Success
- RETURN    ${emp_id}

### `Open Employee List`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Wait until page contains element ${employee_header} (timeout 20s).
- Wait until element ${PIM_EMP_LIST_TAB} is visible (timeout 20s).
- Click ${PIM_EMP_LIST_TAB} (uses the project’s safe click wrapper).
- Wait until element ${EMP_SEARCH_ID} is visible (timeout 20s).

### `Search Employee By Id`
**Arguments:** `${emp_id}`
**Logic (step-by-step):**
- Clear text from ${EMP_SEARCH_ID}.
- Type ${emp_id} into ${EMP_SEARCH_ID}.
- Click ${SEARCH_BTN} (uses the project’s safe click wrapper).
- Wait until element ${EMP_TABLE_BODY} is visible (timeout 20s).

### `Verify Employee Exists In List`
**Arguments:** `${emp_id}`
**Logic (step-by-step):**
- ${locator}=    Replace String    ${target_employee_tpl}    %EMP_ID%    ${emp_id}
- Page Should Contain Element    ${locator}
- Sleep    2S

## pages/RecruitmentPage.robot

### `Open Vacancies`
**Arguments:** _(none)_
**Logic (step-by-step):**
- # Recruitment module header
- Wait until page contains element ${Recruitment_header} (timeout 20s).
- Wait until element ${RECRUIT_VACANCIES_TAB} is visible (timeout 20s).
- Click ${RECRUIT_VACANCIES_TAB} (uses the project’s safe click wrapper).
- # Vacancies page marker (Add button exists on list view)
- Wait until element ${ADD_BTN} is visible (timeout 20s).

### `Open Candidates`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Wait until element ${RECRUIT_CANDIDATES_TAB} is visible (timeout 20s).
- Click ${RECRUIT_CANDIDATES_TAB} (uses the project’s safe click wrapper).
- Wait until element ${ADD_BTN} is visible (timeout 20s).

### `Create Vacancy`
**Arguments:** `${vacancy_name}`, `${hiring_manager}`, `${positions}=1`
**Logic (step-by-step):**
- # Precondition: Vacancies list view
- Click ${ADD_BTN} (uses the project’s safe click wrapper).
- ${url}=    Get Location
- Log To Console    After clicking Add, URL = ${url}
- Wait until page contains element ${Vacany_header} (timeout 20s).
- Log To Console    Add Vacancy header is visible
- Wait until element ${VACANCY_NAME_INPUT} is visible (timeout 20s).
- Click ${VACANCY_NAME_INPUT} (uses the project’s safe click wrapper).
- Type ${vacancy_name} into ${VACANCY_NAME_INPUT}.
- Click ${JOB_TITLE_DDL} (uses the project’s safe click wrapper).
- Select First Option From Open Dropdown
- # Hiring Manager is an autocomplete: type, then pick first suggestion
- Type ${hiring_manager} into ${HIRING_MANAGER_INPUT}.
- Wait until page contains element ${Hiring_role} (timeout 20s).
- Click ${first_role} (uses the project’s safe click wrapper).
- Type ${positions} into ${NUM_POSITIONS}.
- Click ${SAVE_BTN} (uses the project’s safe click wrapper).

### `#Validate new vacancy is created`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    [Arguments]    ${vacancy_name}`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    # Validation flow (no toast): Candidates -> Vacancies -> filter Vacancy -> Search -> assert result`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    Safe Click    ${RECRUIT_CANDIDATES_TAB}`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    Wait Until Element Is Visible    ${RECRUIT_CANDIDATES_TAB}    10s`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    Safe Click    ${RECRUIT_VACANCIES_TAB}`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    Wait Until Element Is Visible    ${RECRUIT_VACANCY_FILTER_DDL}    20s`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    ${cell}=    Set Variable    xpath=//div[contains(@class,"orangehrm-vacancy-list") and @role="table"]//div[normalize-space(.)="${vacancy_name}"]`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `#    Wait Until Keyword Succeeds    10x    1s    Page Should Contain Element    ${cell}`
**Arguments:** _(none)_
**Logic (step-by-step):**

### `Validate new vacancy is created`
**Arguments:** `${vacancy_name}`
**Logic (step-by-step):**
- Click ${RECRUIT_CANDIDATES_TAB} (uses the project’s safe click wrapper).
- Wait until element ${RECRUIT_CANDIDATES_TAB} is visible (timeout 10s).
- Click ${RECRUIT_VACANCIES_TAB} (uses the project’s safe click wrapper).
- Wait until element ${RECRUIT_VACANCY_FILTER_DDL} is visible (timeout 20s).
- ${cell}=    Replace String    ${VACANCY_CELL_TPL}    %VACANCY%    ${vacancy_name}
- Wait Until Keyword Succeeds    10x    1s    Page Should Contain Element    ${cell}

### `Add Candidate`
**Arguments:** `${first}`, `${last}`, `${email}`
**Logic (step-by-step):**
- # Precondition: Candidates list view
- Click ${ADD_BTN} (uses the project’s safe click wrapper).
- Wait until element ${CAND_FIRSTNAME} is visible (timeout 20s).
- Type ${first} into ${CAND_FIRSTNAME}.
- Type ${last} into ${CAND_LASTNAME}.
- Type ${email} into ${CAND_EMAIL}.
- Click ${SAVE_BTN} (uses the project’s safe click wrapper).
- Wait For Toast Success

## pages/SideMenu.robot

### `Go To PIM`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Click ${MENU_PIM} (uses the project’s safe click wrapper).
- Wait Until URL Contains    /pim

### `Go To Recruitment`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Click ${MENU_RECRUIT} (uses the project’s safe click wrapper).
- Wait Until URL Contains    /recruitment

### `Go To Admin`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Click ${MENU_ADMIN} (uses the project’s safe click wrapper).
- Wait Until URL Contains    /admin

## resources/common.robot

### `Open App`
**Arguments:** _(none)_
**Logic (step-by-step):**
- ${browser}=    Set Variable    ${BROWSER}
- ${headless}=   Set Variable    ${HEADLESS}
- IF    '${browser}'=='chrome'
- ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
- Conditionally run: Run Keyword If    '${headless}'=='True' or '${headless}'=='true'    Call Method    ${options}    add_argument    --headless=new
- Call Method    ${options}    add_argument    --window-size
- Call Method    ${options}    add_argument    1920,1080
- Call Method    ${options}    add_argument    --disable-dev-shm-usage
- Call Method    ${options}    add_argument    --no-sandbox
- Open browser 'chrome' and navigate to ${BASE_URL}.
- ELSE IF    '${browser}'=='firefox'
- ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.FirefoxOptions()
- Conditionally run: Run Keyword If    '${headless}'=='True' or '${headless}'=='true'    Call Method    ${options}    add_argument    -headless
- Open browser 'firefox' and navigate to ${BASE_URL}.
- ELSE
- Open browser '${browser}' and navigate to ${BASE_URL}.
- END
- Maximize the browser window.
- Set Selenium speed to ${SEL_SPEED}.

### `Close App`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Close All Browsers

### `Wait For Toast Success`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Wait until element ${TOAST} is visible (timeout 20s).
- Wait until element ${TOAST_SUCCESS} is visible (timeout 20s).

### `Generate Unique`
**Arguments:** `${prefix}`
**Logic (step-by-step):**
- ${rand}=    Generate Random String    6    [LETTERS][NUMBERS]
- ${value}=   Catenate    SEPARATOR=_    ${prefix}    ${rand}
- RETURN    ${value}

### `Capture Screenshot On Failure`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Run Keyword If Test Failed    Capture Page Screenshot

### `Select First Option From Open Dropdown`
**Arguments:** _(none)_
**Logic (step-by-step):**
- Wait until element ${JOB_TITLE_LISTBOX} is visible (timeout 10s).
- Click xpath=(//div[@role='listbox']//span)[1] (uses the project’s safe click wrapper).

### `Wait For App Idle`
**Arguments:** _(none)_
**Logic (step-by-step):**
- # Generic short stabilization for SPA transitions
- Sleep    0.3s
- Wait until page contains element xpath=//body (timeout 10s).

### `Safe Click`
**Arguments:** `${locator}`, `${timeout}=20s`
**Logic (step-by-step):**
- Wait until element ${locator} is visible (timeout ${timeout}).
- Wait Until Element Is Enabled    ${locator}    ${timeout}
- Scroll Element Into View         ${locator}
- ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
- IF    not ${ok}
- ${el}=    Get WebElement    ${locator}
- Execute JavaScript    arguments[0].click();    ARGUMENTS    ${el}
- END
- Wait For App Idle

### `Wait Until URL Contains`
**Arguments:** `${partial}`, `${timeout}=20s`
**Logic (step-by-step):**
- Wait Until Keyword Succeeds    ${timeout}    1s    Location Should Contain    ${partial}

