#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo  $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # populate teams table
  if [[ $WINNER != "winner" ]]
  then
    # get the winner team name
    WINNER_ID=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    # check if winner team doesn't exist in the table
    if [[ -z $WINNER_ID ]]
    then
      # add winner team in the table  
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # check if the winner team is inserted in the table
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        # display message to show which team is added to the table
        echo $WINNER added to teams table from Winners. 
      fi
    fi
    # get the opponent team name
    OPPONENT_ID=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    # check if the opponent team is inserted in the table
    if [[ -z $OPPONENT_ID ]]
    then
      # check if the opponent team is inserted in the table
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        # display message to show which team is added to the table
        echo $OPPONENT added to teams table from Opponents. 
      fi
    fi
  fi
done
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # populate games table
  if [[ $YEAR != "year" ]]
  then
    # get the winner and opponent ids
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # add record in the games table
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    # check if the record is inserted
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      # display the record inserted
      echo $YEAR, $ROUND $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
    fi
    echo 
  fi  
done