*** Settings ***
Documentation    Suite description #automated tests for scout website
Resource    ../Resources/resource.robot

*** Variables ***
${PLAYERSBUTTON}    xpath=//*[text()='Players']
${PLAYERNAMEONLIST}     xpath=//*[@data-testid='MUIDataTableBodyRow-3']/td[1]
${ADDLANGUAGEBUTTON}        xpath=//*[@aria-label='Add language']
${LANGUAGEINPUT}        xpath=//*[@name='languages[0]']
${SUBMITBUTTON}     xpath=//*[text()='Submit']
${SAVEDPLAYERINFO}      xpath=//*[text()='Saved player.']
${REMOVELANGUAGEBUTTON}     xpath=//*[@title='Remove language']
${SAVEDPLAYERINFO}      xpath=//*[text()='Saved player.']

*** Test Cases ***
Add language to existing player form
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign In button
    Click on the Players button
    Click on player name on the list
    Click on Add language button
    Type in language
    Click on the Submit button
    Assert add language
    [Teardown]    Close Browser

Remove language from existing player form
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign In button
    Click on the Players button
    Click on player name on the list
    Click on the Remove language button
    Click on the Submit button
    Assert remove language
    [Teardown]    Close Browser

*** Keywords ***
Click on the Players button
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
Click on the Remove language button
    Wait Until Element Is Visible    ${REMOVELANGUAGEBUTTON}
    Click Element   ${REMOVELANGUAGEBUTTON}
Assert remove language
    Wait Until Element Is Visible   ${SAVEDPLAYERINFO}
    Page Should Not Contain Textfield   ${LANGUAGEINPUT}