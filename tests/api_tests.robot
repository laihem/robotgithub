*** Settings ***
Library           RequestsLibrary
Library           Collections
Library    RobotframeworkRequests

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
Get A Post By ID
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=      GET    jsonplaceholder    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    id
    Log    ${response.json()}
