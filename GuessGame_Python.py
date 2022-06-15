#!/bin/python3

import random
import math
import os

lower = 1
upper = 20

u = str(input("Please enter your name: "))

x = random.randint(lower, upper)
print("\n\tHello, {}! Let us play a game." .format(u))
print('\tI am thinking of a number between 1 and 20. Can you guess it?')
print('\tThe rules are simple - You have 5 chances to guess the number!')
print('\tAfter every attempt I will be guiding you if my number is highter or lower than yours. \n')

count = 0

while count < 5:
count += 1

guess = int(input('Please enter a guess: '))

if x == guess:
print('Congratulations you WIN. The correct number is {}!' .format(x))
if os.path.exists('./prize/'):
os.mkdir ('./prize/')
else:
with open('prize', 'a') as f:
f.write('\n')
f.write('\t1000$ prize for {}' .format(u))
f.close()
break

elif x > guess:
print('Higher!')
elif x < guess:
print('Lower!')
if count == 5 and guess != x:
print('\n\tGAME OVER')
print('\tThe number is {}' .format(x))
print('\tBetter Luck Next time!')


with open('prize', 'w') as f:
f.write('1000$ for {} with {} gueses.\n' .format(u, count))
