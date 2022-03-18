% Runs the MineGrid function and prints the percent of mines in the grid
% as well as the grid itself
clear
clc

% Test cases
inputs = [16,16,20,1,1; ...
          3,4,50,0,-1; ...
          1,1,49,1,4; ...
          0,5,100,0.5,1.6; ...
          3,3,100,1,2];
[rows, columns] = size(inputs);

for row = 1:rows
    % initilising variables, and the retuned grid
    rows = inputs(row,1);
    columns = inputs(row,2);
    percent = inputs(row,3);
    firstRow = inputs(row,4);
    firstColumn = inputs(row,5);
    
    grid = mineGrid(rows, columns, percent, firstRow, firstColumn);
    mineCount = 0;

    % counts the number of mines in the grid
    for row = 1:rows
        for column = 1:columns
            if grid(row, column) == "*"
                mineCount = mineCount + 1;
            end
        end
    end

    % displays the grid and the percent of mines in it
    fprintf("Input: Rows=%d, Columns=%d, Input percent=%.2f\n",...
        rows,columns,percent);
    disp("Actual percent: " + mineCount/(rows * columns) * 100 + "%");
    disp(grid);
end