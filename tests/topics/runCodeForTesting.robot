*** Settings ***
Documentation    Suite description
Documentation   varify to open url
Library           SeleniumLibrary
Library     Collections
Library     RequestsLibrary

*** Test Cases ***
Test title
    @{element_list} =     CREATE LIST    Manufacturer  Trial ID   Slot ID    Pickup Location     Pickup Location      Cryo Preservation      Infusion Center     Delivery Note      Planned Apheresis Date      Collection Pickup Date            Estimated DP Delivery       Subject ID       First Name   Middle Name   Last Name    Gender   Age   DOB   Remarks    Additional comments     Additional Comments
    @{location_dropdown_list1} =     CREATE LIST    First Name   Middle Name   Last Name    Gender   Age   DOB      Remarks

    FOR    ${test}    IN   @{location_dropdown_list1}
    log   ${test}
        List Should Contain Value     ${element_list}     ${test}
     END
*** Keywords ***
Provided precondition
    Setup system under test