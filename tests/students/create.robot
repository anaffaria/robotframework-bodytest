*** Settings ***
Documentation              Cadastro de alunos

Resource                    ../../resources/base.robot

Suite Setup          Start admin Session
Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Novo aluno

    &{student}     Create Dictionary        name=Ana Caroline   email=ana@gmail.com    age=23   weight=72   feet_tall=1.70
    
    Remove Student    ${student.email}
    Go To Students          
    Go To Form Student
    # ações do cenário
    New Student   ${student} 
    #validação
    Toaster Text Should Be    Aluno cadastrado com sucesso. 

    [Teardown]        Thinking And Take Screenshot    2

Cenario: Não permitir email duplicado
    [Tags]    dup
    &{student}     Create Dictionary        name=João Henrique   email=joao@gmail.com    age=30   weight=80   feet_tall=1.70
    

    Insert Student    ${student}

    Go To Students             
    Go To Form Student
    New Student   ${student} 
    Toaster Text Should Be    Email já existe no sistema. 

    [Teardown]        Thinking And Take Screenshot    2

Cenario: Todos os campos devem ser obrigatorios 
    
    @{expected_alerts}        Set Variable        Nome é obrigatório       O e-mail é obrigatório       idade é obrigatória     o peso é obrigatório     a Altura é obrigatória      
    @{got_alerts}             Create List

    Go To Students 
    Go To Form Student
    Submit Studend Form

    FOR     ${index}    IN RANGE   1   6
        ${span}         Get Required Alerts     ${index} 
        Append To List  ${got_alerts}           ${span}
    END     


    Lists Should Be Equal    ${expected_alerts}    ${got_alerts}
Cenario: Validação dos campos numéricos 
    [tags]                temp
    [Template]            Check Type Field On Student Form
    
    ${AGE_FIELD}               number
    ${WEIGHT_FIELD}            number
    ${FEET_TALL}               number
Cenario: Validar campo do tipo email
    [tags]                temp
    [Template]            Check Type Field On Student Form

    ${EMAIL_FIELD}             email 

Cenario: Menor de 14 anos não pode fazer cadastro 

    &{student}     Create Dictionary        name=Livia da Silva  email=livia@gmail.com    age=13   weight=50   feet_tall=1.65
    
    Go To Students
    Go To Form Student
    New Student    ${student}
    Alert Text Should Be    A idade deve ser maior ou igual 14 anos

***Keywords***
Check Type Field On Student Form
    [Arguments]                ${element}        ${type}

    Go To Students   
    Go To Form Student
    Field Should Be Type       ${element}        ${type}