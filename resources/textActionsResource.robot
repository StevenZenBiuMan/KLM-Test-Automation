*** Settings ***
Library  AppiumLibrary
Resource  generalResource.robot

*** Keywords ***
Input Text In EditText Element
  [Arguments]  ${textElement}  ${string}
  Input Text  xpath=//android.widget.EditText[@text='${textElement}']  ${string}
    