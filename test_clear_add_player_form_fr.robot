*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website
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
${CLEARBUTTON}      xpath=//*[span[text()='Clear']]


*** Test Cases ***
Clear add player form
    Open login page
    Type in email
    Type in password
    Click on the Signin button
    Click on the Add Player link
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click on the Clear button
    Assert clear add player form
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on The Signin button
    Click Element   ${SIGNINBUTTON}
Click on the Add Player link
    Wait until element is visible   ${ADDPLAYERLINK}
    Click Link   ${ADDPLAYERLINK}
Type in name
    Wait until element is visible      ${NAMEINPUT}
    Input Text  ${NAMEINPUT}        Robot
Type in surname
    Input Text  ${SURNAMEINPUT}     Test
Type in age
    Input Text  ${AGEINPUT}     01/01/2000
Type in main position
    Input Text  ${MAINPOSITIONINPUT}        goalkeeper
Click on the Clear button
    Click Element   ${CLEARBUTTON}
Assert clear add player form
    Wait until element is visible   ${CLEARBUTTON}
    ${ACTUALNAMEINPUT}=     Get Text    ${NAMEINPUT}
    Should Match    ${ACTUALNAMEINPUT}  ${EMPTY}
    ${ACTUALSURNAMEINPUT}=     Get Text    ${SURNAMEINPUT}
    Should Match    ${ACTUALSURNAMEINPUT}  ${EMPTY}
    ${ACTUALAGEINPUT}=     Get Text    ${AGEINPUT}
    Should Match    ${ACTUALAGEINPUT}  ${EMPTY}
    ${ACTUALMAINPOSITIONINPUT}=     Get Text    ${MAINPOSITIONINPUT}
    Should Match    ${ACTUALMAINPOSITIONINPUT}  ${EMPTY}
    Capture Page Screenshot  alert.png