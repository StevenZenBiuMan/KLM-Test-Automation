*** Settings ***
Library  AppiumLibrary

*** Keywords ***
Wait And Click Id
  [Arguments]  ${target}
  Wait Until Element Is Visible  id=${target}  timeout=10
  Click Element  id=${target}
    
Wait And Click Xpath
  [Arguments]  ${target}  ${xpath}
  Wait Until Element Is Visible  id=${target}
  Click Element  xpath=${xpath}