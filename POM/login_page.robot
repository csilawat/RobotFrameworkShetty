*** Settings ***
Documentation  POM file for Login
Library  SeleniumLibrary

*** Variables ***
${invalid_login_error_element}  //div[contains(text(),"username/password.")]
${iphone_Button}  (//div[@class='card-footer'])[1]/button
${count_checkout}  .btn-primary

*** Keywords ***
open browser With url
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    maximize browser window
    title should be  LoginPage Practise | Rahul Shetty Academy

close the browser
    CLOSE BROWSER

Validate Successfull login
    [Arguments]     ${name}     ${pass}
    input text      username  ${name}
    input password  password  ${pass}
    click button    terms
    click button    id:signInBtn
#    Sleep      10
    #    wait for a particular element
    Element Should Not Be Visible  xpath:${invalid_login_error_element}
    Sleep      10
    click button  xpath:${iphone_Button}
    Element Should Contain  css:${count_checkout}   1


