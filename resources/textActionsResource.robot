*** Settings ***
Library  AppiumLibrary
Resource  generalResource.robot

*** Keywords ***
Input Text In EditText Element
  [Arguments]  ${textElement}  ${string}
  Input Text  xpath=//android.widget.EditText[@text='${textElement}']  ${string}
  
Click On Text
  [Arguments]  ${element}  ${string}
  Wait Until Element Is Visible  id=${element}  timeout=8
  Click Text  ${string}