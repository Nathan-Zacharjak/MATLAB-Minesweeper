function [result] = isMine(rowInput, columnInput, grid)
    % Takes a point in the grid, and returns if you've selected a mine or 
    % not via a boolean value
    
    % Rounding the input row and column indicies in case a fraction is
    % input
    rowInput = round(rowInput);
    columnInput = round(columnInput);
    
    % Checking the input row and column is inside the grid
    [rows, columns] = size(grid);
    if rows < rowInput || 1 > rowInput || columns < columnInput ...
            || 1 > columnInput
        result = false;
    else
        % Else output whether a mine was selected
        if grid(rowInput, columnInput) == "*"
            result = true;
        else
            result = false;
        end
    end
end