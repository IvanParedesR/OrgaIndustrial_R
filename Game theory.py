import nashpy as nash
import numpy as np
A = np.array([[0, -1, 1], [1, 0, -1], [-1, 1, 0]])
rps = nash.Game(A)
rps

B = - A
rps = nash.Game(A, B)
rps

#https://nashpy.readthedocs.io/en/latest/tutorial/index.html#installing-nashpy
