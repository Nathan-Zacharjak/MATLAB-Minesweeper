% Tests isInGrid() with various test cases
clear
clc

grid = ["0","0","*"; "*","*","0"; "0","*","*"];
row = 1;
column = 1;
disp("Test 1: detecting inside the grid");
disp("Expect: 1");
disp(isInGrid(row, column, grid));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
row = 10;
column = 5;
disp("Test 2: detecting outside the grid");
disp("Expect: 0");
disp(isInGrid(row, column, grid));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
row = -5;
column = -3;
disp("Test 3: negative numbers");
disp("Expect: 0");
disp(isInGrid(row, column, grid));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
row = 2.5;
column = 3.2;
disp("Test 4: decimal numbers");
disp("Expect: 1");
disp(isInGrid(row, column, grid));


grid = [];
row = 0;
column = 0;
disp("Test 5: empty grid");
disp("Expect: 0");
disp(isInGrid(row, column, grid));