*** Settings ***
Documentation         Ações da feature de gestão de alunos
Library    Browser

*** Variables *** 
${NAME_FIELD}         css=input[name=name]
${EMAIL_FIELD}        css=input[name=email] 
${AGE_FIELD}          css=input[name=age]
${WEIGHT_FIELD}       css=input[name=weight]
${FEET_TALL}          css=input[name=feet_tall]

*** Keywords ***
Go To Form Student
    Click                      css=[href$="alunos/new"]
    Wait For Elements State    css=h1 >> text=Novo aluno      visible     5

Submit Studend Form  
    Click        xpath=//button[contains(text(), "Salvar")] 

New Student
    [Arguments]      ${student}
    
    Fill Text    ${NAME_FIELD}            ${student.name}
    Fill Text    ${EMAIL_FIELD}           ${student.email}
    Fill Text    ${AGE_FIELD}             ${student.age}
    Fill Text    ${WEIGHT_FIELD}          ${student.weight}
    Fill Text    ${FEET_TALL}             ${student.feet_tall}

    Submit Studend Form

Request Removal By Email 
    [Arguments]    ${email}  

    Click         xpath=//td[contains(text(), '${email}')]/../td//button[@id='trash']

Confirm Removal 
    Click         text=SIM, pode apagar!
Cancel Removal 
    Click         text=NÃO
Student Should Not visible
    [Arguments]    ${email} 

    Wait For Elements State    xpath=//td[contains(text(), '${email}')]    detached     5

Student Should Be visible
    [Arguments]    ${email} 

    Wait For Elements State    xpath=//td[contains(text(), '${email}')]    visible     5
Search Student By name 
    [Arguments]    ${name}

    Fill Text       css=input[placeholder="Buscar aluno"]    ${name}
Student Name Should Be Visible 
    [Arguments]        ${name}

    Wait For Elements State        css=table tbody tr >> text=${name}     visible     5   
