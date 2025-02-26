*** Settings ***
Documentation       This is some basic info about the whole SUITE
Library             SeleniumLibrary
Resource            ../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/crm.robot

*** Variables ***
${Browser} =                chrome
${URL} =                    https://automationplayground.com/crm/
${VALID_LOGIN_EMAIL} =      admin@robotframeworktutorial.com
${VALID_LOGIN_PASSWORD} =   MyPassword!

*** Test Cases ***
Should be able to add new customer
    [Documentation]    This is some basic info about the test
    [Tags]              1006    Smoke   Contacts

    Wait until page contains    Customers Are Priority One!

    click link                 Sign In

    Wait until page contains    Login

    input text                 id=email-id      ${VALID_LOGIN_EMAIL}
    input text                 id=password      ${VALID_LOGIN_PASSWORD}
    click button               Submit
    Wait until page contains    Our Happy Customers

    click link                   id=new-customer
    Wait until page contains    Add Customer

    input text                 id=EmailAddress      janedoe@gmail.com
    input text                 id=FirstName         Jane
    input text                 id=LastName          Doe
    input text                 id=City              Dallas
    select from list by value  id=StateOrRegion       TX
    select radio button        gender       female
    select checkbox            name=promos-name
    click button               Submit
    wait until page contains    Success! New customer added.

    Click Link                    Sign Out
    Wait Until Page Contains      Signed Out


    sleep                           3s


*** Keywords ***

