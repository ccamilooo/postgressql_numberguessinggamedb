#!/bin/bash 
# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

# generate a random variable with a 1 to 1000 range
ACTUAL_NUMBER=$(( RANDOM%1000 +1)) 
#echo $ACTUAL_NUMBER

# First part which is getting the user info and seeing if the user is in the database or not.
USER_INFO(){
# Asking user for name and reading it
echo -e "\nEnter your username:"
read NAME

# Query for checking if number is in the database
USER=$($PSQL "SELECT username FROM number_guessing WHERE username='$NAME'")

# if user is not in the database
if [[ -z $USER ]]
then
INSERT_USER_INFO=$($PSQL "INSERT INTO number_guessing(username) VALUES('$NAME')")
echo $INSERT_USER_INFO
echo -e "Welcome, $NAME! It looks like this is your first time here."


else
# if user is in the database
 if [[ ! -z $USER ]]
 then
 PLAYED_GAMES=$($PSQL "SELECT games_played FROM number_guessing WHERE username='$NAME'")
 BEST_GAME=$($PSQL "SELECT best_game FROM number_guessing WHERE username='$NAME'")
 echo -e "Welcome back, $NAME! You have played $PLAYED_GAMES games, and your best game took $BEST_GAME guesses."
 fi
fi 
}
USER_INFO

# Building the guessing game
GUESSING_GAME(){
  # Asking user to guess a number and reading it.
  echo -e "Guess the secret number between 1 and 1000:"
  COUNT=1
  

  # Loop which continues until the user gets the correct number
 while [[ $ACTUAL_NUMBER -ne $NUMBER ]]
 do
  read NUMBER
  # if input is not a number
   if [[ $NUMBER =~ ([^0-9]+)$ ]]
   then
   echo -e "That is not an integer, guess again:"
   # Count is the number of guesses it takes to get the right answer
   ((COUNT++))
   

    else
    # if input is a number and is greater than the actual number
    if [[ $NUMBER -gt $ACTUAL_NUMBER ]]
    then
    echo -e "It's lower than that, guess again:"
    ((COUNT++))
    

    elif [[ $NUMBER -lt $ACTUAL_NUMBER ]]
    # if input is a number and is lower than the actual number
    then
    echo -e "It's higher than that, guess again:"
    ((COUNT++))
  

    else [[ $NUMBER -eq $ACTUAL_NUMBER ]]
    ((GAMES_PLAYED++))
    # if input is a number and is equals to the actual number
    echo -e "You guessed it in $COUNT tries. The secret number was $ACTUAL_NUMBER. Nice job!"

   fi
  fi

done   
}

GUESSING_GAME

# Afterwards updating user info with the games played and the best game which is the one which took the least no of guesses
UPDATED_INFO(){

  # First updating the games played from the guessing game
  # First check if the games played are in the database
  # If there are no games played in the database
  if [[ -z $PLAYED_GAMES ]]
  then
  PLAYED_GAMES=0 
  PLAYED_GAMES=$(( $PLAYED_GAMES+1 ))
  GAMES_PLAYED_UPDATED=$($PSQL "UPDATE number_guessing SET games_played=$PLAYED_GAMES WHERE username='$NAME'")

   else
   # If there are games played in the database
   if [[ ! -z $PLAYED_GAMES ]]
   then
   PLAYED_GAMES=$(( $PLAYED_GAMES+1 ))
   GAMES_PLAYED_UPDATED=$($PSQL "UPDATE number_guessing SET games_played=$PLAYED_GAMES WHERE username='$NAME'")
   fi
  fi
  # Then choosing the game with the least no of guesses
  UPDATE_BEST_GAME=$($PSQL "UPDATE number_guessing SET best_game=$COUNT WHERE username='$NAME' AND (best_game > $COUNT OR best_game ISNULL)")

}

UPDATED_INFO
