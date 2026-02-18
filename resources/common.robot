*** Settings ***
Resource   testdata.robot
Resource   locators.robot
Library    SeleniumLibrary    timeout=${TIMEOUT}
Library    String

*** Keywords ***
Open App
    ${browser}=    Set Variable    ${BROWSER}
    ${headless}=   Set Variable    ${HEADLESS}

    IF    '${browser}'=='chrome'
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
        Run Keyword If    '${headless}'=='True' or '${headless}'=='true'    Call Method    ${options}    add_argument    --headless=new
        Call Method    ${options}    add_argument    --window-size
        Call Method    ${options}    add_argument    1920,1080
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --no-sandbox
        Open Browser    ${BASE_URL}    chrome    options=${options}
    ELSE IF    '${browser}'=='firefox'
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.FirefoxOptions()
        Run Keyword If    '${headless}'=='True' or '${headless}'=='true'    Call Method    ${options}    add_argument    -headless
        Open Browser    ${BASE_URL}    firefox    options=${options}
    ELSE
        Open Browser    ${BASE_URL}    ${browser}
    END

    Maximize Browser Window
    Set Selenium Speed    ${SEL_SPEED}

Close App
    Close All Browsers

Wait For Toast Success
  Wait Until Element Is Visible    ${TOAST}    20s
  Wait Until Element Is Visible    ${TOAST_SUCCESS}    20s




Generate Unique
    [Arguments]    ${prefix}
    ${rand}=    Generate Random String    6    [LETTERS][NUMBERS]
    ${value}=   Catenate    SEPARATOR=_    ${prefix}    ${rand}
    RETURN    ${value}

Capture Screenshot On Failure
    Run Keyword If Test Failed    Capture Page Screenshot

Select First Option From Open Dropdown
    Wait Until Element Is Visible    ${JOB_TITLE_LISTBOX}    10s
    Safe Click    xpath=(//div[@role='listbox']//span)[1]


Wait For App Idle
    # Generic short stabilization for SPA transitions
    Sleep    0.3s
    Wait Until Page Contains Element    xpath=//body    10s

Safe Click
    [Arguments]    ${locator}    ${timeout}=20s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    Scroll Element Into View         ${locator}

    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${ok}
        ${el}=    Get WebElement    ${locator}
        Execute JavaScript    arguments[0].click();    ARGUMENTS    ${el}
    END
    Wait For App Idle

Wait Until URL Contains
    [Arguments]    ${partial}    ${timeout}=20s
    Wait Until Keyword Succeeds    ${timeout}    1s    Location Should Contain    ${partial}
