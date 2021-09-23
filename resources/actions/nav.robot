***Settings***  
Documentation                 Ações do menu superior de navegação
Library    Browser

***Keywords***

Go To Students
    Click            xpath=//a[contains(text(), 'ALUNOS')]
    Wait For Elements State    css=h1 >> text=Gestão de Alunos      visible    5
Go To Plans
    Click            xpath=//a[contains(text(), 'PLANOS')]
    Wait For Elements State    css=h1 >> text=Gestão de Planos      visible    5

Go To Enrolls
    Click            xpath=//a[contains(text(), 'MATRÍCULAS')]
    Wait For Elements State    css=h1 >> text=Gestão de Matrículas      visible    5
User Should Be Logged In 
    [Arguments]     ${user_name}

    Get Text        css=aside strong    should be   ${user_name}


