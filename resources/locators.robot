*** Variables ***
${LOGIN_USER}              xpath=//input[@name='username']
${LOGIN_PASS}              xpath=//input[@name='password']
${LOGIN_BTN}               xpath=//button[@type='submit']

${USER_DROPDOWN}           xpath=//p[contains(@class,'oxd-userdropdown-name')]
${LOGOUT_BTN}              xpath=//a[normalize-space(.)='Logout']

${TOAST}                   xpath=//div[contains(@class,'oxd-toast')]
${TOAST_SUCCESS}           xpath=//div[contains(@class,'oxd-toast') and (contains(.,'Success') or contains(.,'Successfully'))]

${MENU_PIM}                xpath=//span[normalize-space(.)='PIM']/ancestor::a
${MENU_RECRUIT}            xpath=//span[normalize-space(.)='Recruitment']/ancestor::a
${MENU_ADMIN}              xpath=//span[normalize-space(.)='Admin']/ancestor::a

${PIM_ADD_BTN}             xpath=//button[normalize-space(.)='Add']
${PIM_EMP_LIST_TAB}        xpath=//a[normalize-space(.)='Employee List']
${EMP_FIRSTNAME}           xpath=//input[@name='firstName']
${EMP_LASTNAME}            xpath=//input[@name='lastName']
${EMP_ID}                  xpath=//label[normalize-space(.)='Employee Id']/parent::div/following::div//input
${SAVE_BTN}                xpath=//button[@type='submit' and normalize-space(.)='Save']

${EMP_SEARCH_ID}           xpath=//label[normalize-space(.)='Employee Id']/parent::div/following::div//input
${SEARCH_BTN}              xpath=//button[@type='submit' and normalize-space(.)='Search']
${EMP_TABLE_BODY}          xpath=//div[contains(@class,'oxd-table-body')]

${RECRUIT_VACANCIES_TAB}   xpath=//a[normalize-space(.)='Vacancies']
${RECRUIT_CANDIDATES_TAB}  xpath=//a[normalize-space(.)='Candidates']
${ADD_BTN}                 xpath=//button[normalize-space(.)='Add']

${VACANCY_NAME_INPUT}            xpath=//label[normalize-space(.)="Vacancy Name"]/ancestor::div[contains(@class,"oxd-input-group")]/div[2]//input
${JOB_TITLE_DDL}           xpath=//label[normalize-space(.)="Job Title"]/ancestor::div[contains(@class,"oxd-input-group")]/div[2]//div[contains(@class,"oxd-select-text")]
${JOB_TITLE_LISTBOX}       xpath=//div[@role='listbox']
${HIRING_MANAGER_INPUT}          xpath=//label[normalize-space(.)="Hiring Manager"]/ancestor::div[contains(@class,"oxd-input-group")]/div[2]//input
${NUM_POSITIONS}           xpath=//label[normalize-space(.)="Number of Positions"]/ancestor::div[contains(@class,"oxd-input-group")]/div[2]//input

${CAND_FIRSTNAME}          xpath=//input[@name='firstName']
${CAND_LASTNAME}           xpath=//input[@name='lastName']
${CAND_EMAIL}              xpath=//label[normalize-space(.)='Email']/parent::div/following::div//input

${ADMIN_ADD_BTN}           xpath=//button[normalize-space(.)='Add']
${USER_ROLE_DDL}           xpath=//label[normalize-space(.)='User Role']/parent::div/following::div//div[contains(@class,'oxd-select-text')]
${STATUS_DDL}              xpath=//label[normalize-space(.)='Status']/parent::div/following::div//div[contains(@class,'oxd-select-text')]
${EMP_NAME_ADMIN}          xpath=//label[contains(normalize-space(.),'Employee Name')]/parent::div/following::div//input
${SYS_USERNAME}            xpath=//label[normalize-space(.)='Username']/parent::div/following::div//input
${SYS_PASSWORD}            xpath=//label[normalize-space(.)='Password']/parent::div/following::div//input
${SYS_CONFIRM_PASS}        xpath=//label[contains(normalize-space(.),'Confirm Password')]/parent::div/following::div//input

# Recruitment validation (TC03)
${RECRUIT_VACANCY_FILTER_DDL}  xpath=//label[normalize-space(.)="Vacancy"]/ancestor::div[contains(@class,"oxd-input-group")]/div[2]//div[contains(@class,"oxd-select-text")]
${RECRUIT_LISTBOX}             xpath=//div[@role="listbox"]
${RECRUIT_SEARCH_BTN}          xpath=//button[@type="submit" and normalize-space(.)="Search"]
${RECRUIT_RESULTS_TABLE}       xpath=//div[contains(@class,"oxd-table")]
