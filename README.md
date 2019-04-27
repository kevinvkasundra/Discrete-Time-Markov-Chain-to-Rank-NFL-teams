# Discrete-Time-Markov-Chain-to-Rank-NFL-teams

# Aim
The task is to rank the 32 teams after the
regular season using an algorithm based on Markov chains.
Moreover convert the available game scores into a transition matrix, along with a justification
for such a conversion.
For the constructed matrices, the corresponding stationary distributions should
be computed, and team ranks should be produced.

# Introduction
The National Football League (NFL) is a professional American football league consisting of 32
teams, divided equally between the National Football Conference (NFC) and the American Foot-
ball Conference (AFC). Both conferences consist of four four-team divisions. Each team plays
16 regular-season games; thus, teams do not play all other teams during a single regular season.
The focus of this code is the 2007 NFL regular season. 

# Dataset
All scores, for the 2007 NFL season, can be
downloaded from https://www.pro-football-reference.com.
Each team should is represented by a state in a Markov chain, and team ranks should be based on
values that are proportional to the stationary probabilities of the constructed Markov chain.

*Assigned Number to Each Team:*

State, Team Name
1. Indianapolis Colts
2. New Orleans Saints
3. Carolina Panthers
4. St. Louis Rams
5. Minnesota Vikings
6. Atlanta Falcons
7.	Denver Broncos
8.	Buffalo Bills
9.	Green Bay Packers
10.	Philadelphia Eagles
11.	Washington Redskins
12.	Miami Dolphins
13.	Pittsburgh Steelers
14.	Cleveland Browns
15.	New England Patriots
16.	New York Jets
17.	Tennessee Titans
18.	Jacksonville Jaguars
19.	Houston Texans
20.	Kansas City Chiefs
21.	Detroit Lions
22.	Oakland Raiders
23.	San Diego Chargers
24.	Chicago Bears
25.	Seattle Seahawks
26.	Tampa Bay Buccaneers
27.	Dallas Cowboys
28.	New York Giants
29.	Cincinnati Bengals
30.	Baltimore Ravens
31.	San Francisco 49ers
32.	Arizona Cardinals

# Methodology
The steps in which we would rank the teams is given below:
>1. Abstract the required data provided from ‘https://www.pro-football-reference.com’ into an excel.
>2. Analyse the data in excel and remove the columns which are not required by us to rank the teams, for example Week number, Day, Date, Time, Boxscore, etc.
>3. Import the excel into R-Studio
>4. Assign Teams to different states varying from 1 to 32.
>5. Make a Transition Matrix based on the criteria you want to rank the teams
>6. Normalize the rows of the matrix
>7. Find Stationary distributions of different teams/states and export the data into excel.
>8. Line teams in decreasing order of stationary distribution values and assign corresponding rank from 1 to 32.

# Criteria Used to rank Teams
1. Matrix by assigning W/L scores individually
2. Random Walk Method
3. Difference of W/L points method

# Solution Comparison
