% Takes a grid of mines and an array of chosen values and returns a grid
% only containing the chosen values, the rest are hidden as " "
% If a mine is chosen, all values are displayed.
% The chosen values array must contain one set of coordinates per row.

function [hiddenGrid] = hideGrid(grid, chosenValues)
    % When the given grid is empty, return an empty grid
    if size(grid, 1) == 0 || size(grid, 2) == 0
        hiddenGrid = [];
        return
    end
    
    % Creating an array of the same size as the input grid, contaning
    % " " in every element
    [rows, columns] = size(grid);
    hiddenGrid = string(ones(rows,columns));
    
    for chosenRow = 1:rows
        for chosenColumn = 1:columns
            hiddenGrid(chosenRow,chosenColumn) = " ";
        end
    end
    
    % When the given chosen values array has incorrect dimensions, return a
    % hidden grid
    if size(chosenValues, 2) ~= 2
        if size(chosenValues, 2) ~= 0
            disp("Error: Given chosen values array has incorrect" + ...
                " dimensions, returned a hidden grid");
        end
        return
    end
    
    % Un-hiding all elements in the grid that have been selected, according
    % to the chosenValues array
    % Chosen coordinates are stored per row
    noOfChosenValues = size(chosenValues,1);
    
    for i = 1:noOfChosenValues
        % Rounding the coordinates for the previously chosen points on the
        % grid, in case they are decimal values
        chosenRow = round(chosenValues(i,1));
        chosenColumn = round(chosenValues(i,2));
        
        % Checking the given coordinates are inside the array, else skiping
        if rows >= chosenRow && 1 <= chosenRow && ...
                columns >= chosenColumn && 1 <= chosenColumn
            
            % Reveal the chosen element
            hiddenGrid(chosenRow,chosenColumn) ...
                = grid(chosenRow,chosenColumn);
            
            % Reveal all elements if the chosen element was a mine
            if grid(chosenRow,chosenColumn) == "*"
                hiddenGrid = grid;
                hiddenGrid(chosenRow,chosenColumn) = "X";
                return
            end
        end
        
    end

end