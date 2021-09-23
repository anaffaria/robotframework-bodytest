*** Settings ***
Documentation              Busca de alunos

Resource            ../../resources/base.robot

Suite Setup          Start admin Session
Test Teardown        Take Screenshot



*** Test Cases ***
Cenario: Busca exata
     &{student}     Create Dictionary        name=Steve Jobs   email=jobs@apple.com    age=45   weight=80   feet_tall=1.80

     Remove Student By Name            ${student.name}
     Insert Student                    ${student}
     Go To Students
     Search Student By name            ${student.name}
     Student Name Should Be Visible    ${student.name}
     Total Items Should Be             1    

Cenario: Registro Não Encontrado 
    
    ${name}        Set Variable       Barão Zemo 

    Remove Student By Name                     ${name}
    Go To Students
    Search Student By name                     ${name}
    Register Keyword To Run On Failure         Nenhum registro encontrado
    Wait For Elements State                    css=table     detached     5

Cenario: Busca alunos por um único termo 

    ${fixture}         Get json          students-search.json 
    ${students}        Set Variable      ${fixture['students']}

    ${word}            Set Variable      ${fixture['word']}
    ${total}            Set Variable     ${fixture['total']}

    Remove Student By Name    ${word}              

    FOR     ${item}    IN     @{students}   
       Insert Student    ${item}
    END 

    Go To Students
    Search Student By name    David

    FOR     ${item}    IN     @{students}   
       Student Name Should Be Visible    ${item['name']}
    END 

    Total Items Should Be    ${total}

