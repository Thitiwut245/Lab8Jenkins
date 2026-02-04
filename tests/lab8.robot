*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Computing Headless
    ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Create Webdriver    Chrome    options=${options}
    Go To    https://computing.kku.ac.th

*** Test Cases ***
Open computing Website
    Open Computing Headless
    ${title}=    Get Title
    Should Contain    ${title}    College of Computing, Khon Kaen University
    Close Browser
