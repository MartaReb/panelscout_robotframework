## Introduction
The project was created as part of the "Dare IT Challenge: Wstęp do Testów Automatycznych" course, during which I learned how to write automated tests using the Robot Framework and Selenium Library. Regression tests were written for the [Scouts Panel](https://scouts-test.futbolkolektyw.pl/en/login?redirected=true) application and performed in a [production environment](https://scouts.futbolkolektyw.pl/en/).
The tests were conducted in the Google Chrome browser using chromedriver.

## Getting started
1. Instal [Python](https://www.python.org/), [Robot Framework](https://robotframework.org/) and [Sellenium Library](https://github.com/robotframework/SeleniumLibrary).
2. Clone this repository to your local environment.
3. Add the chromedriver.exe file to the project.

## Run test
To run tests from one file write in console: 
```
robot Tests/name_of_the_file_with_test.robot
```
To run all tests write in consol: 
```
robot Tests
```
