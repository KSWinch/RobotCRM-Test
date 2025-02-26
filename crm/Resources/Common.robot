*** Settings ***
Library     SeleniumLibrary


*** Variables ***

*** Keywords ***
Begin Web Test
    # set selenium speed    .2s
    set selenium timeout  10s

    open browser            ${URL}       ${Browser}

    #resize browser window for recording
    set window position         x=341    y=169
    set window size             width=1935   height=1898

    Wait until page contains    Customers Are Priority One!

End Web Test
    Close All Browsers
