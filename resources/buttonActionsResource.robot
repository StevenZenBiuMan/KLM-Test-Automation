*** Settings ***
Library  AppiumLibrary

*** Keywords ***
Wait And Click Id
  [Arguments]  ${target}
  Wait Until Element Is Visible  id=${target}  timeout=10
  Click Element  id=${target}
    