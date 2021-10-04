*** Settings ***
Documentation  KLM Login
Resource  ../resources/generalResource.robot
Test Setup  Setup
Test Teardown  Close Application

*** Variables ***
${countrySpinner}         ${ANDROID_APP_PACKAGE}:id/countrySpinner
${searchBar}              ${ANDROID_APP_PACKAGE}:id/spinner_search_bar
${bookMenu}               ${ANDROID_APP_PACKAGE}:id/book
${searchTextField}        ${ANDROID_APP_PACKAGE}:id/search_src_text
${originField}            ${ANDROID_APP_PACKAGE}:id/origin_field
${destinationField}       ${ANDROID_APP_PACKAGE}:id/destination_field
${chooseDateButton}       ${ANDROID_APP_PACKAGE}:id/button_confirm
${calendarConfirmButton}  ${ANDROID_APP_PACKAGE}:id/calendar_footer_confirm_button
${origin}                 Dusseldorf
${destination}            Hong Kong
${selectButton}           ${ANDROID_APP_PACKAGE}:id/branded_fares_select_button
${xpathFlightTime}        //android.widget.TextView[@bounds='[56,821][235,914]']
${continueButton}         ${ANDROID_APP_PACKAGE}:id/time_to_think_continue_button
${searchCountryCode}      ${ANDROID_APP_PACKAGE}:id/search_bar
${checkBox}               ${ANDROID_APP_PACKAGE}:id/bf_form_check_box
${skipButton}             ${ANDROID_APP_PACKAGE}:id/ancillary_hub_menu_skip_button
${submitButton}           ${ANDROID_APP_PACKAGE}:id/bf_pax_details_form_submit_button

*** Test Cases ***
Book flight from Dusseldorf to Hong Kong

  # Book flight Screen
  Wait And Click Id  ${bookMenu}
  Wait And Click Id  ${originField} 
  Wait Until Element Is Visible  id=${searchTextField}  timeout=2
  Input Text  id=${searchTextField}  Dus
  Wait Until Page Contains  ${origin}  timeout=5
  Click Text  ${origin}
  Wait And Click Id  ${destinationField}
  Wait Until Element Is Visible  id=${searchTextField}  timeout=2
  Input Text  id=${searchTextField}  Hon
  Wait Until Page Contains  ${destination}  timeout=5
  Click Text  ${destination}
  Wait Until Element Is Visible  id=${chooseDateButton}  timeout=5
  Click Element  id=${chooseDateButton} 
  
  # Pick a date
  Wait And Click Xpath  ${ANDROID_APP_PACKAGE}:id/week_day_one  //android.widget.TextView[@bounds='[56,2014][246,2136]']
  Click Element  xpath=//android.widget.TextView[@bounds='[1194,2220][1384,2342]']
  Wait Until Element Is Visible  id=${calendarConfirmButton}  timeout=2
  Click Element  id=${calendarConfirmButton}
  
  # Outbound overview
  Wait And Click Xpath  ${ANDROID_APP_PACKAGE}:id/flight_card_outbound_time  ${xpathFlightTime}
  Wait And Click Id  ${selectButton}
  
  # Return Flight overview
  Wait And Click Xpath  ${ANDROID_APP_PACKAGE}:id/flight_list_card_view  ${xpathFlightTime}
  Wait And Click Id  ${selectButton}

  # Overview flight
  Wait And Click Id  ${continueButton}
 
  # Personal information form
  Wait Until Element Is Visible  id=${ANDROID_APP_PACKAGE}:id/bf_form_text_input_edit_text  timeout=8
  Click Text  Title
  Wait Until Page Contains  Mr  timeout=5
  Click Text  Mr
  # First name
  ${name}=  Generate Random Name
  Wait Until Element Is Visible  id=${ANDROID_APP_PACKAGE}:id/bf_form_text_input_edit_text  timeout=5
  Input Text In EditText Element  First name  ${name}   
  Scroll Down To Element  ${ANDROID_APP_PACKAGE}:id/bf_form_loyalty_title
  Handle Feedback Popup
  Wait Until Element Is Visible  ${checkBox}  timeout=5
  Input Text In EditText Element  Last name  ${name} 
  # Email
  Input Text In EditText Element  E-mail address  zs.redomk@dyoeii.com
  Click Element  id=${checkBox}
  # Country code
  Click Text  Country code
  Wait Until Element Is Visible  id=${searchCountryCode}   
  Input Text  ${searchCountryCode}  Ne
  Click Text  Netherlands (+31)
  # Phonenumber
  Wait Until Page Contains  Country code  timeout=5
  Scroll Down To Element  ${submitButton}  
  ${numbers}=  Generate Random Numbers
  Input Text In EditText Element  Telephone number 1  ${numbers} 
  Click Element  id=${submitButton}
  
  # Extra option
  Wait And Click Id  ${skipButton}
  
  # Payment
  Wait Until Element Is Visible  id=com.afklm.mobile.android.gomobile.klm:id/payment_group_root
  
  

 