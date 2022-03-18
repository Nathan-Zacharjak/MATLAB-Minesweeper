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

end