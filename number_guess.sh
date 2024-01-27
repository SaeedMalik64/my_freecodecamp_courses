#!/bin/bash

# Number Guessing Game
# set up database connection command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# CHECK_CONNECTION=$($PSQL "SELECT * FROM users")
# echo $CHECK_CONNECTION
NUMBER=$(( RANDOM%1000 + 1 ))
# echo $NUMBER
echo -e "Enter your username:"
read USER_NAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  NEW_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE user_id = $USER_ID")
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# get user guess
GET_NUMBER() {
  if [[ $1 ]]
  then
    echo "That is not an integer, guess again: "
    # echo -e "Guess the secret number between 1 and 1000:"
  fi
  read USER_GUESS
}

ENSURE_NUMBER() {
  GET_NUMBER

  until [[ $USER_GUESS =~ ^[0-9]+$ ]]
  do
    GET_NUMBER again
  done
}
echo "Guess the secret number between 1 and 1000:"
ENSURE_NUMBER
# main game loop
TRIES=1
until [[ $USER_GUESS -eq $NUMBER ]]
do
  ((TRIES++))
  # echo $TRIES
  if [[ $USER_GUESS -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    ENSURE_NUMBER
  else [[ $USER_GUESS -lt $NUMBER ]]
    echo  "It's higher than that, guess again:"
    ENSURE_NUMBER
  fi
done
# echo $user_id
ADD_USER_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number, tries) VALUES($USER_ID, $NUMBER, $TRIES)")
echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
exit 0