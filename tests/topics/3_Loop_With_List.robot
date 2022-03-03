*** Setting ***
Documentation   varify to open url
Resource        8_resource.robot
Test Setup      open browser With base url
Test Teardown   close the browser after test


*** Test Cases ***
Validate UnSuccessfull login
    Fill login form
#    Create list
    Get all Mobiles list
    print webelement text inside list


*** Keywords ***
Fill login form
    input text      username  ${UserName}
    input password  password  ${password}
    click button    terms
    click button    id:signInBtn
    wait until element is visible  xpath://h4[@class='card-title']


Create list
    @{normal_LIst}= Create List     iphone      samsung     nokia       mi
        LOG     @{normal_LIst}

Get all Mobiles list
    @{web_Elements_List} =  Get WebElements     css:.card-title
        LOG     ${web_Elements_List}
     FOR     ${elements}    IN  @{web_Elements_List}
            LOG     ${elements.text}
            Sleep       10
    END

print webelement text inside list
    ${web_Elements_List}=  Get WebELements      xpath://h4[@class='card-title']
#    ${index}=  Set Variable  1
    FOR  ${elements}     IN      @{web_Elements_List}
#            Exit For Loop If       '${elements.text}' == 'Blackberry'
        Sleep       10
#        ${index}=   ${index} + 1
    END

