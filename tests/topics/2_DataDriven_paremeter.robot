*** Setting ***
Documentation   varify to open url
Resource        8_resource.robot
Test Setup      open browser With base url
Test Teardown   close the browser after test
Test Template   Validate UnSuccessfull login


*** Test Cases ***      username    password
Invalid username        123     learning
Invalid password        rahulshettyacademy      123
Valid login         rahulshettyacademy      learning


*** Keywords ***
Validate UnSuccessfull login
    [Arguments]     ${username}     ${password}
    input text      username  ${username}
    input password  password  ${password}
    click button    terms
    click button    id:signInBtn
    #    wait for a particular element
    wait until element is visible  xpath://div[contains(text(),"username/password.")]

#

