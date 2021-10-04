*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Library  DateTime
Library  String
Resource  buttonActionsResource.robot
Resource  textActionsResource.robot


*** Variables ***
# System Variables
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../klmapp/KLM.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=6}
${ANDROID_APP_PACKAGE}        com.afklm.mobile.android.gomobile.klm

# Element Variables
${popUpNoButton}             ${ANDROID_APP_PACKAGE}:id/com_ad4screen_sdk_pop_primary_button


*** Keywords ***
Open Android Test App
  [Arguments]    
  open application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=com.klm.mobile.android.core.activity.SplashScreenActivity  autoGrantPermissions=true  autoDismissAlerts=true

Setup
  Open Android Test App  
  Wait And Click Id  ${countrySpinner} 
  Wait Until Element Is Visible  id=${searchBar}
  Input Text  id=${searchBar}  Ne
  Wait Until Page Contains  Netherlands  timeout=5
  Click Text  Netherlands
  Click Text  Continue
  Wait Until Page Contains  Get started  timeout=2
  Click Text  Get started
  
Generate Random Numbers
    ${number}    Generate random string    10    123456789
    [Return]  ${number}  
    
Generate Random Name
    ${name}   Generate Random String    4    [LOWER]
    [Return]  AUTOTEST${name}
  
Scroll Down To Element
  [Arguments]  ${target}
  FOR    ${x}    IN RANGE    0    7
   Swipe   0    495    0   100
   ${el}    Run Keyword And Return Status    Wait Until Page Contains Element  id=${target}
   Log    ${el}
   Run Keyword If    ${el}     Exit For Loop
   ${x}    Set Variable    ${x}+1
  END
  
Handle Feedback Popup 
   # The Feedback popup around 95 sec
   ${present}=  Run Keyword And Return Status    Wait Until Page Contains  No  timeout=40
   Log    ${present}
   Run Keyword If    ${present}==${TRUE}  Click Text  No
   
Install KLM Application
    Install App  ${ANDROID_APP}  ${ANDROID_APP_PACKAGE}

Remove KLM Application
    Remove Application  ${ANDROID_APP_PACKAGE}
