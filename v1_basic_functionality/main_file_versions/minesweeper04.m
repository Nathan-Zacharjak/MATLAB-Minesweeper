% The master minsweeper file, runs all the functions together to play the
% game!
clear
clc


% Welcome prompt, game stops running if the user doesn't enter 'y'
fprintf("Welcome to minesweeper!\n\n" + ...
    "In this game, your goal is to reveal spaces on a grid without " + ...
    "revealing any mines: '*'.\n" + ...
    "When you reveal all spaces without mines, you win!\n\n");

playGame = input("Are you ready to play? (y/n): ", 's');

if playGame ~= "y"
    return
end


% Asks the user for the size of the grid and proportion of mines
gridRows = input("How many rows should be in the grid: ");
gridColumns = input("How many columns should be in the grid: ");
gridProportion = input("What proportion of mines should be in " + ...
    "the grid? (Recommended: 1/4): ");


% Prepares the grid, initialises variables and prints the grid to the
% console
grid = mineGrid(gridRows, gridColumns, gridProportion);
chosenValues = [];
selection = "0";
hiddenGrid = hideGrid(grid, chosenValues);
printGrid(hiddenGrid);
printGrid(grid);

% Asks for row and column numbers until a mine is selected
while selection ~= "*"
    chosenRow = input("Input a row number: ");
    chosenColumn = input("Input a column number: ");
    selection = grid(chosenRow, chosenColumn);
end
% Testing for a mine being selected
disp("Mine selected");