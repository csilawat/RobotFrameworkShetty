*** Setting ***
Documentation   varify to open url
Resource        8_resource.robot
Library         MyWorld.py
Library     Collections
#Test Setup      open browser With base url
#Test Teardown   close the browser after test

*** Variables ***
@{mobileLIst}   iphone X

*** Test Cases ***
use custome method and add values in cart
    use custome method and add value in cart



*** Keywords ***
use custome method and add value in cart
#    input text      username  rahulshettyacademy
#    input password  password  learning
#    click button    terms
#    click button    id:signInBtn

#    this is Keywords, custom created by us
    hello world
#    log     ${list}.
#    #    wait for a particular element
#    element should not be visible  xpath://div[contains(text(),"username/password.")]
#    Sleep  10
##    this is custom Keyword created in MyWorld.py file using SeleniumLibrary
#    click on element    (//div[@class='card-footer'])[1]/button
    Sleep  10










