# MacOS-Wallpapers-via-Terminal
getpics.sh: It scrapes the webpage https://apod.nasa.gov/apod/astropix.html, which has a new image on it everyday, and sets it as the wallpaper of your main desktop.<br>
Random Wallpapers.sh: It selects a random image from the webpage https://www.cse.iitk.ac.in/users/namanv/pics.html, and sets it as the wallpaper of your main desktop.<br>
Note: This won't change the wallpaper of any other desktop that you have set up on your Mac.

## 1
Each round is: LLL, followed by reduction
The while loop breaks if the order of the smallest vector does not change.

## 2
Each round is: LLL, followed by reduction
The while loop breaks if the largest vector in the basis does not change.
Note: This method is excruciatingly slow.

## 3
Each round is: For each vector, its reduction is followed by LLL on the sub-lattice.
The while loop breaks if the largest vector in the basis does not change.

## 4
The reduction step is a little different. For each vector, the sub-lattice isn't changed.
Rather, the vector itself is changed.
Each round is: For each vector, its reduction is followed by LLL on the sub-lattice.
The while loop breaks if the largest vector in the basis does not change.

## 5
The reduction step is a the same as in 4.
Each round is: LLL, followed by reduction.
The while loop breaks if the largest vector in the basis does not change.

## script.h
Usage: ./script.h <num>
Here, num is the dimension of the matrix that you want to test.
It runs all the executables in the five folders and stores the output into a text file.
If num=30, the text file will be "temp30.txt".
The key data: time taken, number of rounds, smallest vector, largest vector are stored in
<num>.txt, ie if num=30, it is stored in 30.txt

NOTE: 30temp.txt and 30.txt are not finished yet. Had to stop the script because the laptop got
very hot while running the code.

## Terminal Saved Output- 40x40.txt
When I first ran the code in folder 1 on 30x30 and 40x40 matrices of vector orders 206.
For 30x30: Did not note down the time, but it took 6 rounds and the order reduced to 12.
For 40x40: Time: 93m32.409s, it took 5 rounds and the order reduced to 11.

## ./5/Terminal Saved Output- 40x40.txt
Saved this to store the output of 30x30 for folder 5 in a text file.
Results: Initially, the first column has >120 digits in its entries. The initial LLL does
barely anything, but the second LLL does a lot of size-reduction. By the end of the 6th round,
all the entries of the matrix have less than 6 digits. Still, it goes on for a total of 33 rounds.
At the end, only 2 matrix entries have 5 digits, rest all have 4 or less.
Time: 1209.372482, rounds: 33
The smallest vector's norm^2 is:  247604526
The largest vector's norm^2 is:   636579895

### Things to Implement further:
A method in which the while loop breaks if the largest vector's norm is within a certain range of the
previous norm. Something like:
```c
if (old_norm - epsilon <new_norm < old_norm + epsilon) break;
```
