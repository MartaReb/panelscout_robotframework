*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts.futbolkolektyw.pl/en/
${BROWSER}        Chrome
${LANGUAGECHANGEBUTTON}     xpath=//*[contains(@class, 'MuiSelect-root')]
${ENGLISHLANGUAGE}        xpath=//*[@data-value='en']
${POLISHLANGUAGE}     xpath=//*[@data-value='pl']
${REMINDERINENGLISH}        xpath=//*[text()='Remind password']
${REMINDERINPOLISH}     xpath=//*[text()='Przypomnij hasło']

*** Test Cases ***
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

