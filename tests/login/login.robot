***Settings***
Documentation       Suite de testes de Login do Administrador

Resource    ../../resources/base.robot

Suite Setup          Start Browser Session
Test Teardown        Take Screenshot    

#Suite Setup         Log To Console    Tudo aqui acontece antes da suite
#Suite Teardown      Log To Console    Tudo aqui acontece depois da suite 
#Test Setup          Log To Console    Tudo aqui acontece antes do Teste
#Test Teardown       Log To Console    Tudo aqui acontece depois do Teste

***Test Cases***
Cenario: Login do Adminstrador

    Go To Login Page
    Login With                        admin@bodytest.com    pwd123
    User Should Be Logged In          Administrador

    [Teardown]                        Clear Local Storage and Take Screenshot
Cenario: Senha inválida

    Go To Login Page
    Login With                         admin@bodytest.com    abc123
    Toaster Text Should Be             Usuário e/ou senha inválido
    
    [Teardown]                         Thinking And Take Screenshot    2
Cenario: Email não cadastrado

    Go To Login Page
    Login With                         ana@gmail.com   abc123
    Toaster Text Should Be             Usuário e/ou senha inválido
    
    [Teardown]                         Thinking And Take Screenshot    2       
Cenario: Email inválido

    Go To Login Page
    Login With                         admin*bodytest.com    pwd123
    Alert Text Should Be               Informe um e-mail válido

Cenario: Senha não informada

    Go To Login Page
    Login With                          admin&bodytest.com    ${EMPTY}
    Alert Text Should Be                A senha é obrigatória

Cenario: Email não informado

    Go To Login Page
    Login With                          ${EMPTY}    pwd123
    Alert Text Should Be                O e-mail é obrigatório
Cenario: Email e Senha não informado
    [tags]          temp
    Go To Login Page
    Login With                          ${EMPTY}    ${EMPTY}
    Alert Text Should Be                O e-mail é obrigatório
    Alert Text Should Be                A senha é obrigatória