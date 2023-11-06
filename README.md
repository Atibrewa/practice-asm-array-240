# Decoding 2-D matrix access

## What you are given

You have a file called matrix.c. It contains lines at the top that defines what M and N are. Your goal is to leave M as it is define and update N so that the assembly that is made matches the file 

You also have a file called `matrix_commented.s` that has the correct assembly code for a particular value of **N** this **not the same as that given to you in the code.**

If you use make as this code exists, the executable called `matrix` will attempt to access one element, but it won't work until you have changed the defined value for N. You will change the code in main and improve the test in part C below.

## A. Your initial goals: comment and determine N

1. Add comments to the assembly for function get_elem in the file `matrix_commented.s` on each line that you see a pound sign, #. I've helped you with some already.  **Comment only get_elem: assembly code and nothing else, ignoring lines beginning with a 'dot'.**

2. Use the variables r and c in the comments to help you and to demonstrate that you understand the assembly.

2. State in your comments how to determine the correct value of **N** and replace it in your `matrix.c` file.

3. Use make to test whether your new value for **N** is creating the correct assembly in matrix.s that matches `matrix_complete.s`. The Makefile contains a `make compare` option so you can easily test if you got it right.


### <img src="./emblem-important.svg" alt="Important" width="20" align="bottom">  Important
Remember that there is a general formula to access element i,j from a 2D matrix that is in the course slides for 2D arrays. Note that the version for what the assembly needs to do to locate the proper starting byte of the element matrix[i][j] has to include the number of bytes of the type of the elements in the matrix.



## B. Further goal: Describe a function 

In `matrix.c` there is a function without a description (it has a TODO instead). Complete this code by explaining what that function is doing. Be quite specific about what each element of the matrix (2D array) contains. Also add a comment in the code to explain what the two lines in the inner loop are doing, using terms like 'pointer' and 'pointing to'. 

## C. Last task: change the code in main

When you know how this function works and you have the correct value for N in the #define line, it should become clear what the main program is printing for output. Add another call to get_elem() in main using different valid row and column numbers. Then add an assert that tests the value that returns from get_elem for the new values that you chose.
