% Runs chooseZeroes() with serveral different test cases
clear
clc

grid = ["0","0","0","0"; ...
        "0","0","1","1"; ...
        "0","1","2","*"; ...
        "0","1","*","2"];
row = 1;
column = 2;
disp("Test 1: choosing a zero");
disp("Expect: the zero and all surrounding elements to be revealed");
disp(chooseZeroes(row, column, grid));
disp(hideGrid(grid, chooseZeroes(row, column, grid)));


grid = ["0","0","0","0"; ...
        "0","0","1","1"; ...
        "0","1","2","*"; ...
        "0","1","*","2"];
row = 2;
column = 3;
disp("Test 2: choosing a non-zero value");
disp("Expect: only the '1' to be selected");
disp(chooseZeroes(row, column, grid));
disp(hideGrid(grid, chooseZeroes(row, column, grid)));

grid = ["1","1","1","0"; ...
        "1","*","2","1"; ...
        "1","2","*","1"; ...
        "0","1","1","1"];
row = -4;
column = -1;
disp("Test 3: negative numbers");
disp("Expect: nothing to be revealed");
disp(chooseZeroes(row, column, grid));
disp(hideGrid(grid, chooseZeroes(row, column, grid)));

grid = ["1","1","1","0"; ...
        "1","*","2","1"; ...
        "1","2","*","1"; ...
        "0","1","1","1"];
row = 1.7;
column = 2.6;
disp("Test 4: decimal values");
disp("Expect: only (2,3) to be revealed");
disp(chooseZeroes(row, column, grid));
disp(hideGrid(grid, chooseZeroes(row, column, grid)));

grid = [];
row = 1;
column = 2;
disp("Test 5: no grid");
disp("Expect: an empty grid to be returned");
disp(chooseZeroes(row, column, grid));
disp("Size of chooseZeroes(): ");
disp(size(chooseZeroes(row, column, grid)));