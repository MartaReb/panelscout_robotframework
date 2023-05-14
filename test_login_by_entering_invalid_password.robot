*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts.futbolkolektyw.pl/en/
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${INVALIDMESSAGE}   xpath=//*[text()='Identifier or password invalid.']


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert checking invalid message
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test
Click on The Sign in button
    Click Element   ${SIGNINBUTTON}
Assert checking invalid message
    Wait until element is visible       ${INVALIDMESSAGE}
    ${ACTUALINVALIDMESSAGE}=     Get Text    ${INVALIDMESSAGE}
    Should Be Equal     ${ACTUALINVALIDMESSAGE}       Identifier or password invalid.
    Capture Page Screenshot  alert.png

