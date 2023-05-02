*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${ADDPLAYERLINK}        xpath=//*[@href='/en/players/add']
${NAMEINPUT}        xpath=//*[@name='name']
${SURNAMEINPUT}     xpath=//*[@name='surname']
${AGEINPUT}     xpath=//*[@name='age']
${MAINPOSITIONINPUT}        xpath=//*[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[@type='submit']
${MAINPAGEBUTTON}       xpath=//*[text()='Main page']
${LASTCREATEDPLAYERLINK}        xpath=//div[3]/div/div/a[1]
${LASTCREATEDPLAYERNAME}        xpath=//div[3]/div/div/a[1]/button/span[1]
${MATCHESBUTTON}       xpath=//*[text()='Matches']

*** Test Cases ***
Add player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Add Player link
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit Button
    Click On The Main Page Button
    Assert last created player
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on The Sign in button
    Click Element   ${SIGNINBUTTON}
Click on the Add Player link
    Wait until element is visible   ${ADDPLAYERLINK}
    Click Element       ${ADDPLAYERLINK}
Type in name
    Wait until element is visible      ${NAMEINPUT}
    Input Text  ${NAMEINPUT}        Robot
Type in surname
    Wait until element is visible   ${SURNAMEINPUT}
    Input Text  ${SURNAMEINPUT}     Test
Type in age
    Input Text  ${AGEINPUT}     01/01/2000
Type in main position
    Input Text  ${MAINPOSITIONINPUT}        goalkeeper
Click On The Submit Button
    Click Element   ${SUBMITBUTTON}
Click On The Main Page Button
    Wait until element is visible   ${MATCHESBUTTON}
    Click Element      ${MAINPAGEBUTTON}
Assert last created player
    Wait until element is visible   ${LASTCREATEDPLAYERNAME}
    ${ACTUALLANGUAGEVALUE}=     Get Text    ${LASTCREATEDPLAYERLINK}
    Should Match    ${ACTUALLANGUAGEVALUE}  ROBOT TEST
    Capture Page Screenshot  alert.png