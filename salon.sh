#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Sana's Salon ~~~~~\n"

DISPLAY_MAIN_MENU() {
    # check if an argument is passed and print it
    if [[ $1 ]]
    then
        echo -e "\n$1"
    fi

    echo -e "Welcome to my Salon. How may I help you?\n"
    SERVICE_CHOICES=$($PSQL "SELECT * FROM services")
    echo "$SERVICE_CHOICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done
    echo -e "\nPlease select an option from the above."
    read SERVICE_ID_SELECTED
    # check to see if selection is valid
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
        IS_VALID_OPTION_SELECTED=1
    elif [[ -z $($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED") ]]
    then
        IS_VALID_OPTION_SELECTED=2
    else
        IS_VALID_OPTION_SELECTED=0
    fi
    echo $IS_VALID_OPTION_SELECTED
}

DISPLAY_MAIN_MENU
while [[ $IS_VALID_OPTION_SELECTED -ne 0 ]]
do 
    DISPLAY_MAIN_MENU "You entered an invalid option!"
done
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
# check if customer exists
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi    
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME

# insert the appointment
NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/ |/"/')
CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
