*** Settings ***
Documentation    Suite description #automated tests for scout website
Resource    ../Resources/resource.robot

*** Variables ***
${PAGELOGO}     xpath=//*[text()='Scouts Panel']
${SIGNOUTBUTTON}    xpath=//*[text()='Sign out']

*** Test Cases ***
Sign out from the system
    Open login page
    Type in valid email
    Type in valid password
    Click on the Sign In button
    Click on the Sign out button
    Assert sign out from the system
    [Teardown]    Close Browser

*** Keywords ***
Click on the Sign out button
    Wait until element is visible   ${SIGNOUTBUTTON}
    Click Element   ${SIGNOUTBUTTON}
Assert sign out from the system
    Wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot  alert.png
