*** Settings ***
Documentation    Suite description #automated tests for scout website
Resource    ../Resources/resource.robot

*** Variables ***
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
${CLEARBUTTON}      xpath=//*[span[text()='Clear']]

*** Test Cases ***
Add player
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign In button
    Click on the Add Player link
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit Button
    Click On The Main Page Button
    Assert last created player
    [Teardown]    Close Browser

Clear add player form
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign In button
    Click on the Add Player link
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click on the Clear button
    Assert clear add player form
    [Teardown]    Close Browser

*** Keywords ***
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