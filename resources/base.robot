***Settings***
Documentation              Tudo começa aqui, meu arquivo base do projeto automação

Library                    Browser
Library                    OperatingSystem
Library                    libs/DeloreanLibrary.py
Library                    Collections
Library                    DateTime

Resource                   actions/auth.robot
Resource                   actions/nav.robot
Resource                   actions/students.robot
Resource                   actions/components.robot
Resource                   actions/plans.robot
Resource                   actions/enrolls.robot

*** Keywords ***
Start Browser Session 
    New Browser     chromium    False
    New Page        about:blank
Start admin Session
    Start Browser Session
    Go To Login Page
    Login With                        admin@bodytest.com    pwd123
    User Should Be Logged In          Administrador
Clear Local Storage and Take Screenshot
    Take Screenshot    
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]            ${timeout}

    Sleep                  ${timeout}
    Take Screenshot

Helpers
Get json
    [Arguments]    ${file-name}

    ${file}=          Get File                ${EXECDIR}/resources/fixtures/${file-name}
    ${json_object}    Evaluate                json.loads($file)        json

    [Return]          ${json_object}