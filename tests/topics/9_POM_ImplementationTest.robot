*** Setting ***
Documentation   Implement Page Object Model
Resource        /Users/csilawat/PycharmProjects/RobotFramworkDemo/POM/inputs_Data.robot
Resource        /Users/csilawat/PycharmProjects/RobotFramworkDemo/POM/login_page.robot
Test Setup      open browser With url
Test Teardown   close the browser


*** Test Cases ***
Login through Page Object Model
    Validate Successfull login      ${UserName}     ${password}

#    we can directly call with class name . method name
    login_page.Validate Successfull login      ${UserName}     ${password}


