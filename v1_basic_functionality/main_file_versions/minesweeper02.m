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


% Generates the grid and asks for the first input
grid = mineGrid(gridRows, gridColumns, gridProportion);
% Seeing if the grid matches what was input
disp(grid);