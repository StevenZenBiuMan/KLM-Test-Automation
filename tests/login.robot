*** Settings ***
Documentation  KLM Login
Resource  ../resources/generalResource.robot
Test Setup  Setup
Test Teardown  Close Application

*** Variables ***
${flyingBlue}         ${ANDROID_APP_PACKAGE}:id/flying_blue

*** Test Cases ***
Login
  Wait And Click Id  ${flyingBlue}
  Wait Until Page Contains  ${destination}  timeout=5
  Click Text  Log in