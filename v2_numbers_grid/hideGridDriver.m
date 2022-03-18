% Runs hideGrid() with several test cases
clear
clc

disp("Testing not selecting a mine, expect only selected elements" + ...
    " to be revealed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [2,3; 1,2; 4,1];
disp(hideGrid(grid,chosenValues));


disp("Testing selecting a mine, expect all elements" + ...
    " to be revealed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [2,3; 1,1; 4,1];
disp(hideGrid(grid,chosenValues));


disp("Testing giving an empty chosen values array, " + ...
    "expect no elements to be revealed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [];
disp(hideGrid(grid,chosenValues));


disp("Testing giving an empty grid, " + ...
    "expect an empty grid of size ( 0 0 ) to be returned, ");
grid = [];
chosenValues = [2,3; 1,1; 4,1];
disp("No. of rows and columns of the returned grid:");
disp(size(hideGrid(grid,chosenValues)));


disp("Testing giving decimal coordinates, " + ...
    "expect element (3,3) and (1,2) to be revealed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [2.5,3.1; 1.2,5.5; 1.1,2.3];
disp(hideGrid(grid,chosenValues));


disp("Testing negative chosen values, " + ...
    "expect no elements to be revealed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [-2,-3; -1,-1; -4,-1];
disp(hideGrid(grid,chosenValues));


disp("Testing giving a chosenValues array with 1 element per row, " + ...
    "expecting a hidden grid to be returned, " + ...
    "and an error message to be displayed");
grid = ["*","0","*"; "*","0","0";"0","0","0";"0","0","*"];
chosenValues = [2; 1; 4];
disp(hideGrid(grid,chosenValues));


disp("Testing giving a grid with 1 row, " + ...
    "expect only the chosen elements to be revealed");
grid = ["*","0","*","*","0","0","0","0","0","0"];
chosenValues = [1,6; 1,2; 1,7];
disp(hideGrid(grid,chosenValues));


disp("Testing giving a grid with 1 column, " + ...
    "expect only the chosen elements to be revealed");
grid = ["*"; "*"; "0"; "0"];
chosenValues = [3,1; 4,1];
disp(hideGrid(grid,chosenValues));