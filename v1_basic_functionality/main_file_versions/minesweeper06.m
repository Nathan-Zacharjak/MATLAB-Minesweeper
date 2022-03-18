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


while playGame == "y" || playGame == "Y"
    % Asks the user for the size of the grid and proportion of mines
    gridRows = input("How many rows should be in the grid: ");
    gridColumns = input("How many columns should be in the grid: ");
    gridProportion = input("What proportion of mines should be in " + ...
        "the grid? (Recommended: 1/4): ");


    % Initilising grid and variables
    grid = mineGrid(gridRows, gridColumns, gridProportion);
    chosenValues = [];
    hiddenGrid = hideGrid(grid, chosenValues);
    gameOver = false;
    % Generic game over message in case it isn't set when needed
    gameOverMessage = "Game Over! Do you want to play again? (y/n): ";
    
    
    % Printing the initial hidden grid to the console
    printGrid(hiddenGrid);

    % Asks for row and column numbers until a mine is selected
    while ~gameOver
        % Gets and stores the user's choice on the grid
        chosenRow = input("Input a row number: ");
        chosenColumn = input("Input a column number: ");
        chosenValues = [chosenValues; chosenRow,chosenColumn];

        % Prints the grid to the console
        hiddenGrid = hideGrid(grid, chosenValues);
        printGrid(hiddenGrid);
        
        % Checks whether the game is won or lost yet
        if isMine(chosenRow, chosenColumn, grid)
            gameOverMessage = "Oh no! You selected a mine, " + ...
                "do you want to play again? (y/n): ";
            gameOver = true;
        elseif isWin(grid, chosenValues)
            gameOverMessage = "You've selected all spaces without " + ...
                "a mine!, do you want to play again? (y/n): ";
            gameOver = true;
        end
    end

    % At the end of the game, ask if you want to play again
    playGame = input(gameOverMessage, 's');
end