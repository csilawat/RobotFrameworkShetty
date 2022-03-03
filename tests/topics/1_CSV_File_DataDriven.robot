*** Setting ***
Documentation   varify to open url
Library         DataDriver    file=dataFiles/data.csv   encoding=utf_8
Resource        8_resource.robot
Test Setup      open browser With base url
Test Teardown   CLOSE BROWSER
Test Template   Validate UnSuccessfull login


*** Test Cases ***
Login with user ${name} and password ${pass}      test    test


*** Keywords ***
Validate UnSuccessfull login
    [arguments]     ${name}     ${pass}
    input text      username    ${name}
    input password  password    ${pass}
    click button    terms
    click button    id:signInBtn
    #    wait for a particular element
    wait until element is visible  xpath://div[contains(text(),"username/password.")]
