#!/bin/bash

# Add some Colour
Def=$’\e[0m’
Red=$’\e[0;31m’
Green=$’\e[0;32m’
Yellow=$’\e[0;33m’
Blue=$’\e[0;34m’
Mag=$’\e[0;35m’
Cyan=$’\e[0;36m’

BRed=$’\e[1;31m’
BGreen=$’\e[1;32m’
BYellow=$’\e[1;33m’
BBlue=$’\e[1;34m’

# Randomize the number + vars
n=$[($RANDOM % 20) +1]

correct=0; fail=0; Max=6; attempt=1

# Manual
echo –e “$Yellow Hello $USER! Let’s play a little game. I am thinking of a number between 1 and 20. Can you guess it? $Def”
sleep 1
echo –e “$Yellow The rules are simple – you have 5 attempts to guess the number I am thinking of. After every attempt I will be guiding you if my number is higher or lower than the one you guessed. $Def”

## Game core
echo –n “$BYellow Please enter your guess: $Def”
while read guess; do

#Attempt not in scope
	if [ $guess –lt 1 ]; then
		echo –e “This number is too low! We are playing with numbers between 1 and 20 only.”
	elif [ $guess –gt 20 ]; then
		echo –e “This number is too high! We are playing with numbers between 1 and 20 only.”
	fi

# Higher / Lower / Eq
	if [ $guess -eq $n ]; then
		echo –e “$BGreen Congratulations, you WIN. The correct number is $n ! $Def”
		attempts=$(($attempts+1))
		echo –e “$BGreen Attempts needed: $attempts $Def”
break
	elif [ $fail –ge $Max ]; then
		echo –e “$Bred \nGAME OVER $Def”
		break
	elif [ $guess –gt $n ]; then
		echo –e “$Cyan Lower $Def”
		fail=$(($fail+1))
		attempts=$(($attempts+1))
	elif [ $guess –lt $n ]; then
		echo –e “$Mag Hihger $Def” 
		fail=$(($fail+1))
		attempts=$(($attempts+1))
	fi

# Remaining attempts
	if [ $fail –eq 1 ]; then
		Echo –e “$Red \n4 attempts remaining. $Def”
	elif [ $fail –eq 2 ]; then
		Echo –e “$Red \n3 attempts remaining. $Def”
	elif [ $fail –eq 3 ]; then
		Echo –e “$Red \n2 attempts remaining. $Def”
	elif [ $fail –eq 4 ]; then
		Echo –e “$Red \nLast attempt! $Def”
	fi

	if [ $guess –ne $n ]; then
		echo –n “$BYellow Please try with another number: $Def”
	fi
done
