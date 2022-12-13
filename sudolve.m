function [solved, solved_img] = sudolve(img)
    
    % get the sudoku from the img input
    board = segmentation(img);
    numbers = board_reader(board);

    % save numbers to txt file
    writematrix(numbers, 'sudoku.txt');

    % execute python script to solve sudoku saved to sudoku.txt
    pyrunfile('sudoku_solver.py');

    solved = readmatrix('sudoku.txt');
    solved_img = draw_numbers(board, numbers, solved);
end
