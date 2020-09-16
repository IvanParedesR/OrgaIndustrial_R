import nashpy as nash
import numpy as np
A = np.array([[1, -1], [-1, 1]])
matching_pennies = nash.Game(A)
matching_pennies
#Zero sum game with payoff matrices:

import nashpy as nash
import numpy as np
A = np.array([[3, 0], [5, 1]])
B = np.array([[3, 5], [0, 1]])
prisoners_dilemma = nash.Game(A, B)
prisoners_dilemma
#Bi matrix game with payoff matrices:

import nashpy as nash
import numpy as np
A = np.array([[3, 0], [5, 1]])
B = np.array([[3, 5], [0, 1]])
prisoners_dilemma = nash.Game(A, B)

#Proabilidades

sigma_r = np.array([1, 0])
sigma_c = np.array([1, 0])
prisoners_dilemma[sigma_r, sigma_c]

sigma_r = np.array([1 / 2, 1 / 2])
sigma_c = np.array([1 / 2, 1 / 2])
prisoners_dilemma[sigma_r, sigma_c]
