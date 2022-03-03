*** Settings ***
Documentation  Resource file for resuable keywords, variables and settings
Library  SeleniumLibrary

*** Keywords ***
open browser With base url
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    maximize browser window
    title should be  LoginPage Practise | Rahul Shetty Academy

close the browser after test
    CLOSE BROWSER

*** Variables ***
${UserName}    rahulshettyacademy
${password}    learning
${invalid_password}    1234
