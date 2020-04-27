# example to demonstrate the computation of eigenvalues and eigenvectors
# for python 2 compatibility #
from __future__ import print_function
#                            #
import numpy as np
np.set_printoptions(precision=4)

print('This is the example data set:')
V = np.matrix([[2.8, 2.2, 2.2, 1.6, 2.5, 1.4, 1.8, 1.2, 2.1, 1.3],
               [3.0, 2.0, 2.8, 1.6, 2.7, 1.2, 2.1, 1.5, 2.3, 1.4],
               [7.0, 7.4, 6.2, 6.4, 6.6, 7.0, 6.9, 7.1, 6.5, 7.1]])
print(V.T)

m1, m2, m3 = np.mean(V[0,:]), np.mean(V[1,:]), np.mean(V[2,:])
print("The mean vector is: [%f, %f, %f]" % (m1, m2, m3))

print("Press a return key to continue and see the covariance C:")
try: #Python 2
  raw_input()
except NameError: #Python 3
  input()
kov = np.cov(V)
print(kov)

print("\npress a return key to continue and show the eigenvectors and eigenvalues...")
try: #Python 2
  raw_input()
except NameError: #Python 3
  input()
eigval, eigvec = np.linalg.eig(kov)
print("\nEigen vectors")
print(eigvec)
print("\nEigen values")
print(eigval)

print("\nAnd finally, just to prove the equation: C u = lambda u")
print("For example, take the 2nd eigenvalue and eigenvector")
try: #Python 2
  raw_input()
except NameError: #Python 3
  input()

print("First C u")
print(np.dot(kov, eigvec[:,[2]]))
print("\nthen lambda u")
print(np.dot(eigval[2], eigvec[:,2]))

np.set_printoptions(precision=8)
