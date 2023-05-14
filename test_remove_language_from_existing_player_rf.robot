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
${SUBMITBUTTON}     xpath=//button[@type='submit']
${REMOVELANGUAGEBUTTON}     xpath=//*[@title='Remove language']
${SAVEDPLAYERINFO}      xpath=//*[text()='Saved player.']

*** Test Cases ***
Remove language from existing player form
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Players button
    Click on player name on the list
    Click on the Remove language button
    Click on the Submit button
    Assert remove language
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
Click on the Players button
    Wait Until Element Is Visible     ${PLAYERSBUTTON}
    Click Element      ${PLAYERSBUTTON}
Click on player name on the list
    Wait Until Element Is Visible      ${PLAYERNAMEONLIST}
    Click Element       ${PLAYERNAMEONLIST}
Click on the Remove language button
    Wait Until Element Is Visible    ${REMOVELANGUAGEBUTTON}
    Click Element   ${REMOVELANGUAGEBUTTON}
Click on the Submit button
    Wait Until Element Is Visible   ${SUBMITBUTTON}
    Click Element   ${SUBMITBUTTON}
Assert remove language
    Wait Until Element Is Visible   ${SAVEDPLAYERINFO}
    Page Should Not Contain Textfield   ${LANGUAGEINPUT}