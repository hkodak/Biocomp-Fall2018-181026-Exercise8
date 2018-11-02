####### Exercise 8 10/26/18 #######
UWvsMSU = read.table("UWvMSU_1-22-13.txt", header = T, stringsAsFactors = F)
View(UWvsMSU)
str(UWvsMSU)

#Using score by score information from UMvsMSU game generate a line graph with a 
#cumulative score for each team as a function of time in the game 
#Generate a matrix of data frame with a cumulative score for each for each
#team whenever either team scores 
#for plotting, use, plot(x,y,type='1) and add a second line to the graph using lines(x,y)

View(UWvsMSU)

#Example: Notes:

pvscoreMSU<-0
pvscoreUW<-0

for (i in 1:nrow(UWvsMSU)) {
  if (UWvsMSU$team[i] == "UW"){
    pvscoreUW = pvscoreUW + UWvsMSU$score[i]
    UWvsMSU$cumsum[i] = pvscoreUW
  }else{
    pvscoreMSU = pvscoreMSU + UWvsMSU$score[i]
    UWvsMSU$cumsum[i] = pvscoreMSU
  }
}

View(UWvsMSU)
UWvsMSU$cumsum
str(UWvsMSU)

#Now we have added a new column to the score dataframe that contains the cumulative scores for
#each team separately as a function of time. 
#These can now be plotted 
#the x axis will be time and the y axis will be cumulative score 

#I need to separate the MSU and UW data to create lines for them:
UW = UWvsMSU[UWvsMSU$team == "UW",]
MSU = UWvsMSU[UWvsMSU$team == "MSU",]

#now plot x and y 
x= UW$time
y=UW$cumsum
x2= MSU$time
y2=MSU$cumsum
plot(x,y, col="blue", type='l')
lines(x2, y2, col = "purple")


#2.) Write a game called "guess my number". The computer will generate a random number between 
#1 and 100. The user types in a number and a computer replies lower if the random number is lower and 
#higher if the random number is higher than the guess and correct if the guess is correct.
#The player can continue guessing until they get it right 

#write a function that will give "Guess:" as a prompt line to allow user to enter a number
guess.number = function(){ 
  guess = readline(prompt = "Guess: ")
  return(as.integer(number))
}
print(guess.number())

#make random number:
x= 1:100
random.number = sample(x,1,replace=TRUE)
guess = -1

#Then do if else for input values, if the input value is lower than random.number, print "lower"
#else if higher print "higher", if correct guess print "correct!" 

print("Guess a number between 0 and 100.")

while (guess!= random.number){
  guess = guess.number()
  if (guess < random.number) {
    print("lower")
    guess.number()
  } 
  else if (guess > random.number){
    print("higher")
    guess.number()
  } 
  else (guess == random.number) {
    print("Correct!")
  }
}

### Now put it all together in one function:

guessingGame = function(guess){ #Define function guessingGame
  #Randomly sample a number assigned the object "random.number"
  random.number = sample(1:100,1,replace=TRUE)
  guess = NA
  print("Guess a number between 0 and 100.")
  #The user guesses a number between 1 and 100 and assign it to the object "guess"
  guess = readline(prompt = "Guess: ")
  while (guess!= random.number){ #Start the while loop for when guess != random.number
    if (guess < random.number) { #Ask whether guess is < random.number
      print("lower")
      #Have the user guess again. If you don't guess again it'll print "lower" forever.
      guess = readline(prompt = "Guess: ")
    } 
    else if (guess > random.number){
      print("higher")
      #Have the user guess again. If you don't guess again it'll print "higher" forever.
      guess = readline(prompt = "Guess: ")
    } 
    else (guess == random.number){
      print("Correct!")
    }
  } 
  
}



