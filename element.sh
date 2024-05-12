#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ELEMENT_INTRO() {
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  elif [[ $1 =~ ^[0-9]+$ ]]
    # argument is atomic_number
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")
    TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id = properties.type_id WHERE atomic_number = $1")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $1")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $1")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $1")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]
  then
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1'")
    TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id = properties.type_id FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE symbol = '$1'")
    MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE symbol = '$1'")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE symbol = '$1'")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE symbol = '$1'")
    if [[ -z $SYMBOL ]]
    then
      echo "I could not find that element in the database."
    else
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  elif [[ $1 =~ ^[A-Z][a-z]{2,}$ ]]
  then
    NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$1'")
    TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id = properties.type_id FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE name = '$1'")
    MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE name = '$1'")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE name = '$1'")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE name = '$1'")
    if [[ -z $NAME ]]
    then
      echo "I could not find that element in the database."
    else
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  else
    echo "I could not find that element in the database."
  fi
}

ELEMENT_INTRO $1