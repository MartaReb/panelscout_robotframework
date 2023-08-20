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
${LANGUAGECHANGEBUTTON}     xpath=//*[contains(@class, 'MuiSelect-root')]
${ENGLISHLANGUAGE}        xpath=//*[@data-value='en']
${POLISHLANGUAGE}     xpath=//*[@data-value='pl']
${REMINDERINENGLISH}        xpath=//*[text()='Remind password']
${REMINDERINPOLISH}     xpath=//*[text()='Przypomnij hasło']

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

Change language on the login page
    Open login page
    Click on the dropdown list with languages
    Click on the Polish language
    Assert changing language to Polish
    Click on the dropdown list with languages again
    Click on the English language
    Assert changing language to English
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
Click on the dropdown list with languages
    Click Element   ${LANGUAGECHANGEBUTTON}
Click on the Polish language
    Click Element   ${POLISHLANGUAGE}
Assert changing language to Polish
    Wait until element is visible   ${REMINDERINPOLISH}
    ${ACTUALLANGUAGE}=     Get Text    ${REMINDERINPOLISH}
    Should Be Equal     ${ACTUALLANGUAGE}   Przypomnij hasło
Click on the dropdown list with languages again
    Click Element   ${LANGUAGECHANGEBUTTON}
Click on the English language
    Click Element   ${ENGLISHLANGUAGE}
Assert changing language to English
    Wait until element is visible   ${REMINDERINENGLISH}
    ${ACTUALLANGUAGE}=     Get Text    ${REMINDERINENGLISH}
    Should Be Equal     ${ACTUALLANGUAGE}    Remind password
    Capture Page Screenshot  alert.png