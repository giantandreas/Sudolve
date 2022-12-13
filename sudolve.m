function solved = sudolve(img)
    
    % get the sudoku from the img input
    board = segmentation(img);
    numbers = board_reader(board);

    % save numbers to txt file
    writematrix(numbers, 'sudoku.txt');

end
