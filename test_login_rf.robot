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

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on The Submit button
    Click Element   ${SIGNINBUTTON}
Assert dashboard
    wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot  alert.png
