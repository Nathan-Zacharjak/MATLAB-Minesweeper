% Returns an array randomly containing "mines" (asterisks) and zeroes,
% given the dimensions and percent of mines
function [grid] = mineGrid(rows, columns, percent)
    % Handling non-positive and deicmal inputs for rows and columns
    if rows < 1 || columns < 1 
        grid = [];
        return
    end
    rows = round(rows);
    columns = round(columns);
    
    % Handling percents outside the range of 0-1,
    % if percent is greater than 1 but less than or equal to 100, it is
    % interpreted as a percentage
    if percent < 0
        percent = 0;
    elseif percent > 100
        percent = 100;
    end
    
    % initilising the grid, and number of mines in the grid
    mineCount = round(rows * columns * percent/100);
    grid = string(zeros(rows, columns));
    
    % Continually randomly assigns spaces with a mine
    while mineCount > 0
        row = round(rand()*(rows-1)+1);
        column = round(rand()*(columns-1)+1);
        
        % Some spaces may already have a mine, so skip it and try again
        if grid(row, column) ~= "*"
            grid(row, column) = "*";
            mineCount = mineCount - 1;
        end
    end
    
    % Filling out the grid with numbers showing the number of mines next to
    % that space
    
    % Go through every row and column of the grid and find the
    % mines
    for row = 1:rows
        for column = 1:columns
            if isMine(row, column, grid)
                % Then for all spaces around the mine in a 3x3
                % square, that are actualy inside the grid and
                % not mines, add 1 to them
                for i = row-1:row+1
                    for j = column-1:column+1
                        if isInGrid(i,j,grid) && grid(i,j) ~= "*"
                            gridNumber = str2num(grid(i,j));
                            gridNumber = gridNumber + 1;
                            grid(i,j) = string(gridNumber);
                        end
                    end
                end
            end
        end 
    end
end