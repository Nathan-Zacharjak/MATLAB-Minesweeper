% Takes a grid, and prints its elements contained within square brackets
% to the console

function printGrid(grid)
    [rows, columns] = size(grid);
    
    % Print out a message when the grid has no elements, instead of
    % printing nothing
    if rows == 0 || columns == 0
        fprintf("[Empty Grid]\n");
    end
    
    % Printing out the given grid, with square brackets around each space
    for row = 1:rows
        for column = 1:columns
            stringElement = string(grid(row,column));
            fprintf("[%s]\t", stringElement);
        end
        fprintf("\n");
    end
end