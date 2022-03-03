*** Settings ***
Library     RequestsLibrary
Library     Collections
Library         MyWorld.py
*** Variables ***
${url}  https://swapi.dev/api/people
${projectUrl}  https://h7ryyyn6hk.execute-api.us-east-2.amazonaws.com/dev/trials/-/slots?emailId=Brancheck@cgi.connect.test

*** Test Cases ***
Quick Get Request Test
    ${response}=   GET  https://www.google.com

Quick Get A JSON Body Test from project API
    ${response}=   GET  ${projectUrl}
    log  ${response}

    log  ${response.json()}
    log  ${response.json()}[0][slots]
    log  ${response.json()}[0][slots][0]
    log  ${response.json()}[0][slots][0][slotCode]
    log  ${response.json()}[0][slots][0][status]

#     ${data}    evaluate  json.loads(str(type(${response.json()})))    json
#      ${datatype}=  evaluate  str(type($data))
#      log    ${datatype}


Quick Get Request With Parameters Test
    ${response}=   GET  https://www.google.com/search  params=query=ciao  expected_status=200

Quick Get A JSON Body Test
    ${response}=   GET  ${url}
    log  ${response}
    log  ${response.json()}
    log  ${response.json()}[results]
    @{list} =   convert to list   ${response.json()}[results]
    log  get from list      ${list}  0
    log  ${response.json()}[results][0]
     log  ${response.json()}[results][0][name]
#    Should Be Equal As Strings    1  ${response.json()}[id]

#*** Settings ***
#Library  Collections
#
#*** Test Cases ***
#Create map in python
#    &{data} =   Create Dictionary    name=chaitanya      lastname=silawat    company=HashedIn
#    log     ${data}
#    Dictionary Should Contain Item   ${data}  name  chaitanya