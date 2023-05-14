*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts.futbolkolektyw.pl/en/
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${PLAYERSBUTTON}    xpath=//*[text()='Players']
${PLAYERNAMEONLIST}     xpath=//*[@data-testid='MUIDataTableBodyRow-3']/td[1]
${ADDLANGUAGEBUTTON}        xpath=//*[@aria-label='Add language']
${LANGUAGEINPUT}        xpath=//*[@name='languages[0]']
${SUBMITBUTTON}     xpath=//*[text()='Submit']
${SAVEDPLAYERINFO}      xpath=//*[text()='Saved player.']

*** Test Cases ***
Add language to existing player form
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on Players button
    Click on player name on the list
    Click on Add language button
    Type in language
    Click on the Submit button
    Assert add language
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Sign in button
    Click Element   ${SIGNINBUTTON}
Click on Players button
    Wait until element is visible    ${PLAYERSBUTTON}
    Click Element   ${PLAYERSBUTTON}
Click on player name on the list
    Wait until element is visible    ${PLAYERNAMEONLIST}
    Click Element   ${PLAYERNAMEONLIST}
Click on Add language button
    Wait until element is visible   ${ADDLANGUAGEBUTTON}
    Click Element   ${ADDLANGUAGEBUTTON}
Type in language
    Wait until element is visible   ${LANGUAGEINPUT}
    Input Text  ${LANGUAGEINPUT}    polish
Click on the Submit button
    Click Element       ${SUBMITBUTTON}
Assert add language
    Wait until element is visible       ${SAVEDPLAYERINFO}
    Reload Page
    ${ACTUALADDEDLANGUAGE}=     Get Value    ${LANGUAGEINPUT}
    Should Be Equal     ${ACTUALADDEDLANGUAGE}      polish
    Capture Page Screenshot  alert.png
