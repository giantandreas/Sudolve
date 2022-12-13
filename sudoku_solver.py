from sudoku import Sudoku
import numpy as np


# read unsolved board from txt file
board = np.loadtxt("sudoku.txt", dtype='i', delimiter=',')

# solve the sudoku
puzzle = Sudoku(3, 3, board=board.tolist())
solution = puzzle.solve()

# write the solution back to txt file
f = open('sudoku.txt', 'w')
np.savetxt(f, solution.board, fmt='%i', delimiter=',', newline='\n')
f.close()