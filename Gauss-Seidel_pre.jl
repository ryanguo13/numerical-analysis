## for computing the spectral radius

using LinearAlgebra

A = [4 1 2; 3 5 1; 1 1 3];
D = Diagonal(A); # Diagonal part
L = tril(A, -1); # Strictly lower triangle part
U = triu(A, 1); # Strictly upper triangle part
G = -inv(L+D)*U; # Iteration Matrix
eigenvalues=eigvals(G) # Compute the eigenvalues
spectral_radius = maximum(abs.(eigenvalues)) # Compute the spectral radius

println("Spectral Radius: ", spectral_radius)