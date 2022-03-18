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
    for row = 1:rows+1
        for column = 1:columns+1
            % Printing the row and column number, 
            % on the first row and column
            if row == 1 && column == 1
                fprintf("[ ]\t");
            elseif row == 1 && column ~= 1
                stringElement = string(column-1);
                fprintf("[%s]\t", stringElement);
            elseif column == 1 && row ~= 1
                stringElement = string(row-1);
                fprintf("[%s]\t", stringElement);
            else
                % Else printing out the actual grid
                stringElement = string(grid(row-1,column-1));
                fprintf("[%s]\t", stringElement);
            end
        end
        fprintf("\n");
    end
end