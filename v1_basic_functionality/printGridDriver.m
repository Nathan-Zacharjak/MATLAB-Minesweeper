% Runs printGrid() with several test cases
clear
clc

fprintf("Test 1: a fully revealed grid. \nExpect the grid to be "...
    + "printed without quotation marks\n");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
printGrid(grid);
fprintf("\n");


fprintf("Test 2: a hidden grid. \nExpect a space between all square "...
    + "brackets\n");
grid = [" "," "," "; " "," "," ";" "," "," ";" "," "," "];
printGrid(grid);
fprintf("\n");


fprintf("Test 3: no grid. \nExpect [Empty Grid] to be printed.\n");
grid = [];
printGrid(grid);
fprintf("\n");


fprintf("Test 4: row grid. \nExpect a row grid to be printed.\n");
grid = ["*","0","0","*","0","*","*"];
printGrid(grid);
fprintf("\n");


fprintf("Test 5: column grid. \nExpect a column grid to be printed.\n");
grid = ["*";"0";"0";"*";"0";"*";"*"];
printGrid(grid);
fprintf("\n");


fprintf("Test 6: single number input. \nExpect [41] to be printed.\n");
grid = 41;
printGrid(grid);
fprintf("\n");

// test