***Settings***
Documentation             Ações de autorização
Library    Browser

***Keywords***
Go To Login Page
    Go to           https://bodytest-web-ana.herokuapp.com

Login With
    [Arguments]     ${email}      ${pass}

    Fill Text       css=input[name=email]       ${email}
    Fill Text       css=input[name=password]    ${pass}
    Click           text=Entrar

