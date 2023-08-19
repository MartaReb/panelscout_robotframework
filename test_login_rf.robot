*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${PAGELOGO}     xpath=//*[text()='Scouts Panel']
${INVALIDMESSAGE}   xpath=//*[text()='Identifier or password invalid.']

*** Test Cases ***
Login to the system
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign in button
    Assert dashboard
    [Teardown]    Close Browser

Login to the system by entering invalid login
    Open login page
    Type in invalid email
    Type in valid password
    Click on the Sign in button
    Assert checking invalid message
    [Teardown]    Close Browser

Login to the system by entering invalid password
    Open login page
    Type in valid email
    Type in invalid password
    Click on the Sign in button
    Assert checking invalid message
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in valid email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in valid password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on The Sign in button
    Click Element   ${SIGNINBUTTON}
Assert dashboard
    Wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot  alert.png
Type in invalid email
    Input Text   ${LOGININPUT}   user04@gmail.pl
Assert checking invalid message
    Wait until element is visible       ${INVALIDMESSAGE}
    ${ACTUALINVALIDMESSAGE}=     Get Text    ${INVALIDMESSAGE}
    Should Be Equal     ${ACTUALINVALIDMESSAGE}       Identifier or password invalid.
    Capture Page Screenshot  alert.png
Type in invalid password
    Input Text   ${PASSWORDINPUT}   Test