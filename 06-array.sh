#! /bin/bash

# This is called as Array instead of single value it can hold multiple values
PERSONS=("Khizar" "Macha" "Prakash" "Madhav")

echo "First Person: ${PERSONS[0]}"

echo "All Persons: ${PERSONS[@]}"