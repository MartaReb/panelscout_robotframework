*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts.futbolkolektyw.pl/en/
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${PAGELOGO}     xpath=//*[text()='Scouts Panel']
${SIGNOUTBUTTON}    xpath=//*[text()='Sign out']

*** Test Cases ***
Sign out from the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Sign out button
    Assert sign out from the system
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on The Submit button
    Click Element   ${SIGNINBUTTON}
Click on the Sign out button
    Wait until element is visible   ${SIGNOUTBUTTON}
    Click Element   ${SIGNOUTBUTTON}
Assert sign out from the system
    Wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot  alert.png
