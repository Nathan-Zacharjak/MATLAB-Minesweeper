% Takes a row and column and the grid, and returns an array of all rows and
% columns that surround the chosen point that are safe to reveal, for all
% revealed points recursively
function [chosenValues] = chooseZeroes(chosenRow, chosenColumn, grid)
    chosenValues = [];
    [rows, columns] = size(grid);
    chosenRow = round(chosenRow);
    chosenColumn = round(chosenColumn);
    
    % When the given grid is empty, or the chosen values are outside the
    % grid, return no chosen values
    if size(grid, 1) == 0 || size(grid, 2) == 0 || rows < chosenRow || ...
            1 > chosenRow || columns < chosenColumn || 1 > chosenColumn
        return
    end

    % If the chosen space isn't a zero, return just the row and column that
    % was selected
    if grid(chosenRow, chosenColumn) ~= "0"
        chosenValues = [chosenRow, chosenColumn];
        return
    else
        % If the chosen space is a zero, get all surrounding values
        for i = chosenRow-1:chosenRow+1
            for j = chosenColumn-1:chosenColumn+1
                if isInGrid(i,j,grid)
                    chosenValues = [chosenValues; i, j];
                end
            end
        end
    end
end