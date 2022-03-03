*** Setting ***
Documentation   varify to open url
Resource        8_resource.robot
Test Setup      open browser With base url
Test Teardown   close the browser after test


*** Test Cases ***
#Validate UnSuccessfull login
#    Fill login form

Switch main window to new then main
     Fill login form
    Switch from main to new window


#Validate only login
#    fil login form with argumenta   ${UserName}    ${invalid_password}


*** Keywords ***
Fill login form
    input text      username  ${UserName}
    input password  password  ${password}
    click button    terms
    click button    id:signInBtn

#    wait for a particular element
#    wait until element is visible  xpath://div[contains(text(),"username/password.")]
#
##    verify text -: get text of element and verify it like Asserts
#    element text should be  xpath://div[contains(text(),"username/password.")]  Incorrect username/password.
#
##    cspture screenshot of particular Webelement
#    capture element screenshot  xpath://div[contains(text(),"username/password.")]

#    capture full page screen shots
    capture page screenshot

fil login form with argumenta
        [arguments]     ${userName}     ${invalid_password}
        input text      username  ${userName}
        input password  password  ${invalid_password}
        click button    terms

#        click on radio button
        Sleep   5
        Click Element   xpath:(//span[@class='checkmark'])[2]

#       Click on pop up
        Sleep   5
        Click Button  css:button#okayBtn

#        select value from dropDown list
        Sleep   5
#            Keywords                   locators                 value
        Select From List By Value   css:select.form-control     teach

#        Click on check box
        Sleep   5
        Select Checkbox     css:input#terms

#        wait or sleep
        Sleep   5

        click button    id:signInBtn

        #    wait for a particular element
        wait until element is visible  xpath://div[contains(text(),"username/password.")]

#    verify text -: get text of element and verify it like Asserts
        element text should be  xpath://div[contains(text(),"username/password.")]  Incorrect username/password.


Switch from main to new window

#    open browser    https://rahulshettyacademy.com/loginpagePractise/       chrome
    Sleep   10
    switch window   NEW
    Sleep   10
    switch window   MAIN
    Sleep   5
