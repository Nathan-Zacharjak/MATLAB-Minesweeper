% The master minsweeper file, runs all the functions together to play the
% game!
clear
clc


% Welcome prompt, game stops running if the user doesn't enter 'y'
fprintf("Welcome to minesweeper!\n\n" + ...
    "In this game, your goal is to reveal spaces on a grid without " + ...
    "revealing any mines: '*'.\n" + ...
    "Any revealed number tells you " + ...
    "how many mines surround that space.\n" + ...
    "When you reveal all spaces without mines, you win!\n\n");

playGame = input("Are you ready to play? (y/n): ", 's');


while playGame == "y" || playGame == "Y"
    % Asks the user for the size of the grid and percent of mines
    % Holds them in loops until a valid number is input
    gridRows = 0;
    gridColumns = 0;
    gridPercent = -1;
    while gridRows < 0.5
        gridRows = input("How many rows should be in the grid: ");
        if gridRows < 0.5
            fprintf("Please input a positive number.\n");
        end
    end
    
    while gridColumns < 0.5
        gridColumns = input("How many columns should be in the grid: ");
        if gridColumns < 0.5
            fprintf("Please input a positive number.\n");
        end
    end
    
    while gridPercent < 0 || gridPercent > 100
        gridPercent = input("What percentage of spaces should be mines? " + ...
        "(Recommended: 20): ");
        if gridPercent < 0 || gridPercent > 100
            fprintf("Please input a number between 0 and 100.\n");
        end
    end

    
    % Initilising grid and variables
    grid = mineGrid(gridRows, gridColumns, gridPercent);
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
        
        % Checking for input that won't reveal anything on the grid so a
        % message is displayed explaning why
        
        % Checking for invalid input
        validInput = true;
        if chosenRow < 0.5 || chosenColumn < 0.5 || chosenRow > ...
                gridRows + 0.5 || chosenColumn > gridColumns + 0.5
            validInput = false;
        end
        
        % Checking for duplicate input
        [rows, columns] = size(chosenValues);
        duplicateInput = false;
        for row = 1:rows
            if chosenValues(row, 1) == chosenRow && ...
                    chosenValues(row, 2) == chosenColumn
                duplicateInput = true;
            end
        end
        
        % Printing this turn to the console, with a warning message or game
        % over message if appropriate
        
        % Warning messages
        if duplicateInput
            hiddenGrid = hideGrid(grid, chosenValues);
            printGrid(hiddenGrid);
            fprintf("You've already chosen that space!\n");
        elseif ~validInput
            hiddenGrid = hideGrid(grid, chosenValues);
            printGrid(hiddenGrid);
            fprintf("Choose a space inside the grid!\n");
        else
            % Choose all values surrounding a zero recursively, else just
            % choose the input coordinate
            chosenValues = [chosenValues; ...
                chooseZeroes(chosenRow, chosenColumn, grid)];

            % Prints the grid to the console
            hiddenGrid = hideGrid(grid, chosenValues);
            printGrid(hiddenGrid);

            % Checks whether the game is won or lost yet
            if isMine(chosenRow, chosenColumn, grid)
                gameOverMessage = "Oh no! You selected a mine...\n" + ...
                    "Do you want to play again? (y/n): ";
                gameOver = true;
            elseif isWin(grid, chosenValues)
                gameOverMessage = "You've selected all spaces without " + ...
                    "a mine! You win!\nDo you want to play again? (y/n): ";
                gameOver = true;
            end
        end
    end

    % At the end of the game, ask if you want to play again
    playGame = input(gameOverMessage, 's');
end