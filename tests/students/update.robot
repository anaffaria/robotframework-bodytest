*** Settings ***
Documentation              Atualização de alunos

Resource            ../../resources/base.robot

Suite Setup          Start admin Session
Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Atualizar um aluno já cadastrado

   ${fixture}     Get json    students-update.json

   ${kamalakhan}    Set Variable    ${fixture['before']}
   ${msmarvel}    Set Variable      ${fixture['after']}

   Remove Student By Name     ${kamalakhan['name']}
   Remove Student By Name     ${msmarvel['name']}

   Insert Student             ${kamalakhan}
   Go To Students
   Search Student By name     ${kamalakhan['name']}
   Go To Student Update For   ${kamalakhan['email']}  
   Update A Student           ${msmarvel}
   Toaster Text Should Be     Aluno atualizado com sucesso.
   [Teardown]                 Thinking And Take Screenshot    2
       
*** Keywords ***
Go To Student Update For
    [Arguments]        ${email}
    
    Click        xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State    css=h1 >> text=Edição de aluno        visible     5

Update A Student
    [Arguments]      ${student}
    
    Fill Text        ${NAME_FIELD}            ${student['name']}
    Fill Text        ${EMAIL_FIELD}           ${student['email']}
    Fill Text        ${AGE_FIELD}             ${student['age']}
    Fill Text        ${WEIGHT_FIELD}          ${student['weight']}
    Fill Text        ${FEET_TALL}             ${student['feet_tall']}

    Submit Studend Form