*** Setting ***
Documentation   varify to open url
Library           SeleniumLibrary

*** Test Cases ***
Validate UnSuccessfull login
    open chrome browser
    Fill login form

*** Keywords ***
open chrome browser
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    maximize browser window
    title should be  LoginPage Practise | Rahul Shetty Academy
#    CLOSE BROWSER

Fill login form
    input text      username  admin
    input password  password  admin
    click button    terms
    click button                 id:signInBtn
#    wait for a particular element
    wait until element is visible  xpath://div[contains(text(),"username/password.")]
#    verify text -: get text of element and verify it like Asserts
    element text should be  xpath://div[contains(text(),"username/password.")]  Incorrect username/password.
#    cspture screenshot of particular Webelement
    capture element screenshot  xpath://div[contains(text(),"username/password.")]
#    capture full page screen shots
    capture page screenshot
    CLOSE BROWSER