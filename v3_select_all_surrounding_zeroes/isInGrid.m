% Takes a set of coordinates and returns true if the coordinates are inside
% the grid, false otherwise
function [insideGrid] = isInGrid(row, column, grid)
    [rows, columns] = size(grid);
    row = round(row);
    column = round(column);
    
    if row <= rows && row >= 1 && column <= columns && column >= 1
        insideGrid = true;
    else
        insideGrid = false;
    end
end