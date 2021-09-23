*** Settings ***
Documentation              Remover alunos

Resource            ../../resources/base.robot

Suite Setup          Start admin Session
Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Remover aluno cadastrado 
      &{student}     Create Dictionary        name=Robert Pattinson   email=batman@dc.com    age=27   weight=70   feet_tall=1.80
      
      Insert Student                ${student}
      Go To Students
      Search Student By name        ${student.name}
      Request Removal By Email      ${student.email}
      Confirm Removal
      Toaster Text Should Be        Aluno removido com sucesso.
      Student Should Not visible    ${student.email}

      [Teardown]                    Thinking And Take Screenshot    2

Cenario: Desistir da exclusão 
     &{student}     Create Dictionary        name=Alice    email=alice@gmail.com    age=27   weight=70   feet_tall=1.80
      
      Remove Student By Name        ${student.name}
      Insert Student                ${student}
      Go To Students
      Search Student By name        ${student.name}
      Reload
      Request Removal By Email      ${student.email}
      Cancel Removal  
      Student Should Be visible     ${student.email}              

