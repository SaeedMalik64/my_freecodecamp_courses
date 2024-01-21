# declare the PSQL variable
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# test PSQL command
# TEST_RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number =1")
# echo -e "$TEST_RESULT"

# check to see if no argument is passed
INPUT_ARG=$1
if [[ -z $INPUT_ARG ]]
then
  echo Please provide an element as an argument.
else
  if [[ $INPUT_ARG =~ ^[0-9]+$ ]]
  then
    SELECTED_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number =$INPUT_ARG")
    # echo -e "$SELECTED_ELEMENT_RESULT"
    # echo Atomic number passed
  elif [[ ${#INPUT_ARG} -lt 3 ]]
  then
    SELECTED_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol ='$INPUT_ARG'")
    # echo -e "$SELECTED_ELEMENT_RESULT"
    # echo Symbol passed
  else
      SELECTED_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name ='$INPUT_ARG'")
    # echo -e "$SELECTED_ELEMENT_RESULT"
    # echo Element passed
  fi
  # Check if SELECTED_ELEMENT_RESULT is empty
  if [[ -z $SELECTED_ELEMENT_RESULT ]]
  then
    echo -e "I could not find that element in the database."
  else
    # echo $SELECTED_ELEMENT_RESULT 
    IFS='|'
    set $SELECTED_ELEMENT_RESULT
    ATOMIC_NUMBER=$2
    SYMBOL=$3
    NAME=$4
    TYPE=$8
    MASS=$5
    MELTING_POINT=$6
    BOILING_POINT=$7
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi  
fi
