% Runs the mineSelect function, giving it a grid to test on and displays
% its output
clear
clc

grid = ["0","0","0","0"; "0","*","0","*"; "*","*","0","0"];
rowInput = 2;
columnInput = 3;

disp("Testing: Selecting safe spot");
disp("Input: 2,3");
disp("Expect: 0");
disp(isMine(rowInput, columnInput, grid));
disp(grid);


grid = ["0","0","0","0"; "0","*","0","*"; "*","*","0","0"];
rowInput = 2;
columnInput = 2;

disp("Testing: Selecting a mine");
disp("Input: 2,2");
disp("Expect: 1");
disp(isMine(rowInput, columnInput, grid));
disp(grid);


grid = [];
rowInput = 2;
columnInput = 3;

disp("Testing: Empty grid");
disp("Input: 2,3");
disp("Expect: 0");
disp(isMine(rowInput, columnInput, grid));
disp(grid);


grid = ["0","0","0","0"; "0","*","0","*"; "*","*","0","0"];
rowInput = -4;
columnInput = 2;

disp("Testing: Negative number input");
disp("Input: -4,2");
disp("Expect: 0");
disp(isMine(rowInput, columnInput, grid));
disp(grid);


grid = ["*","*","0","*"; "0","*","0","*"; "*","*","0","0"];
rowInput = 2.5;
columnInput = 1.5;

disp("Testing: Decimal number input");
disp("Input: 2.5,1.5");
disp("Expect: 1");
disp(isMine(rowInput, columnInput, grid));
disp(grid);