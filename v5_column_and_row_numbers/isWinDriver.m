% Runs isWin() with serveral different test cases
clear
clc

grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1,1; 1,2; 2,3; 3,1];
disp("Test 1: detecting a win");
disp("Expect: 1");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1,1; 1,2; 2,3];
disp("Test 2: detecting not yet a win");
disp("Expect: 0");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1,1; 1,2; 2,3; 1,3; 3,1];
disp("Test 3: detecting a mine, even though all safe spaces are revealed");
disp("Expect: 0");
disp(isWin(grid, chosenValues));


grid = [];
chosenValues = [1,1; 1,2; 2,3; 3,1];
disp("Test 4: empty grid");
disp("Expect: 1");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [];
disp("Test 5: no chosen values");
disp("Expect: 0");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [-1,-1; 7,2; -2,9; 3,-1];
disp("Test 6: choosing outside the grid");
disp("Expect: 0");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1,1.6; 0.7,1.9; 2.2,3; 3,1];
disp("Test 7: decimal values");
disp("Expect: 1");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1; 2; 3];
disp("Test 8: incorrect chosen values dimensions");
disp("Expect: 1, with error message");
disp(isWin(grid, chosenValues));


grid = ["0","0","*"; "*","*","0"; "0","*","*"];
chosenValues = [1,1; 1,1; 1,1; 2,3];
disp("Test 9: duplicate chosen values");
disp("Expect: 0");
disp(isWin(grid, chosenValues));