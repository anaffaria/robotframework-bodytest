*** Settings ***
Documentation              Gestão de Matrículas

Resource                    ../../resources/base.robot

Suite Setup          Start admin Session
Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Deve exibir data inicial e final conforme o plano escolhido

    ${fixture}        Get json            enroll-dates.json

    ${john}           Set Variable        ${fixture['student']}
    ${black}          Set Variable        ${fixture['plan']}

    Insert Student    ${john}   
    Insert Plan       ${black}

    Go To Enrolls
    Go To Form Enrolls
    Select Student     ${john['name']}  
    Select Plan        ${black['title']}
    Start Date Should Today
    End Date Should Today    ${fixture['days']}

Cenario: Deve matricular um aluno em um plano 
    ${fixture}        Get json            enroll-create.json

    ${sara}           Set Variable        ${fixture['student']}
    ${fit}            Set Variable        ${fixture['plan']}

    Insert Student            ${sara}   
    Insert Plan               ${fit}

    Go To Enrolls
    Go To Form Enrolls
    Select Student             ${sara['name']}  
    Select Plan                ${fit['title']}
    Submit Enrolls Form    
    Toaster Text Should Be     Matrícula cadastrada com sucesso

    [Teardown]                 Thinking And Take Screenshot    2

   
*** Keywords ***
Start Date Should Today
    ${start_date}         Get Current Date        result_format=%d/%m/%Y
    Get Attribute         css=input[name=start_date]        value         equal         ${start_date} 

End Date Should Today
    [Arguments]        ${days}

    ${current_date}    Get Current Date

    ${end_date}        Add Time To Date        ${current_date}    ${days} days       result_format=%d/%m/%Y

    Get Attribute         css=input[name=end_date]          value         equal         ${end_date}