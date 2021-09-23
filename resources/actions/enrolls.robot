*** Settings ***
Documentation         Ações da feature de gestão de planos
Library    Browser


*** Keywords ***
Go To Form Enrolls
    Click       css=a[href$="matriculas/new"]
    Wait For Elements State     css=h1 >> text=Nova matrícula     visible     5

Select Student
    [Arguments]        ${name}
    
    Fill Text         css=input[aria-label="student_id"]           ${name}
    Click             css=div[id*=option] >> text=${name}

Select Plan
    [Arguments]        ${title}
    
    Fill Text         css=input[aria-label="plan_id"]          ${title}
    Click             css=div[id*=option] >> text=${title}

Submit Enrolls Form
    Click             css=button[form=formEnrollment]    