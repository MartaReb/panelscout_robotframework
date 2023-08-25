*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${LOGININPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in valid email
    Input Text   ${LOGININPUT}   user04@getnada.com
Type in valid password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Sign In button
    Click Element   ${SIGNINBUTTON}