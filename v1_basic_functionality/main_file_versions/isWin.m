% Takes a grid of mines and an array of chosen values and returns a boolean
% value if all spaces that don't contain a mine in the grid are revealed
% If a mine is chosen, even if all spaces are revealed, this function 
% returns false.
% The chosen values array must contain one set of coordinates per row.
% And no duplicate values.
function [win] = isWin(grid, chosenValues)
    % When the given grid is empty, return a win
    if size(grid, 1) == 0 || size(grid, 2) == 0
        win = true;
        return
    end
    
    % When there are no chosen values yet, return false
    if size(chosenValues, 2) == 0
        win = false;
        return
    end
    
    % Checking if the chosen values array has incorrect dimensions
    if size(chosenValues, 2) ~= 2
        disp("Error: Given chosen values array has incorrect" + ...
                " dimensions, forced a win to reset game");
        win = true;
        return
    end
    
    % Counting the number of all non-mine spaces
    nonMineCount = 0;
    [rows, columns] = size(grid);
    for row = 1:rows
        for column = 1:columns
            if grid(row, column) ~= "*"
                nonMineCount = nonMineCount + 1;
            end
        end
    end
    
    % Detecting if all non-mine spaces have been selected
    % Chosen coordinates are stored per row
    noOfChosenValues = size(chosenValues,1);
    nonMineChosenCount = 0;
    alreadyChosenValues = [];
    
    for i = 1:noOfChosenValues
        % Check for duplicate values in chosen values array so they aren't
        % double-counted
        duplicateValue = false;
        for j = 1:size(alreadyChosenValues,1)
            if alreadyChosenValues(j,1) == chosenValues(i,1) ...
                    && alreadyChosenValues(j,2) == chosenValues(i,2)
                duplicateValue = true;
            end
        end
        alreadyChosenValues = ...
            [alreadyChosenValues; chosenValues(i,1), chosenValues(i,2)];
        
        % Rounding the coordinates for the previously chosen points on the
        % grid, in case they are decimal values
        chosenRow = round(chosenValues(i,1));
        chosenColumn = round(chosenValues(i,2));
        
        % Checking the given coordinates are inside the array, and the
        % value is not a duplicate one, else skipping
        if ~duplicateValue && rows >= chosenRow && 1 <= chosenRow && ...
                columns >= chosenColumn && 1 <= chosenColumn
            % Count any chosen non-mine spaces
            if grid(chosenRow, chosenColumn) ~= "*"
                nonMineChosenCount = nonMineChosenCount + 1;
            else
                % If a mine is ever part of the selection list, return
                % false
                win = false;
                return
            end
        end
    end
    
    % After all selected spaces have been counted, if all non-mine spaces
    % were selected, return true
    if nonMineChosenCount >= nonMineCount
        win = true;
    else
        win = false;
    end
    
end