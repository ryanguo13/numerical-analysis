using LinearAlgebra
A = [4 1 2; 3 5 1; 1 1 3];
D = Diagonal(A); # Diagonal matrix
R = A - D; # Off-diagonal matrix
G = -inv(D)*R; # Iteration matrix
eigenvalues=eigvals(G) # Compute the eigenvalues
spectral_radius = maximum(abs.(eigenvalues)) # Compute the spectral radius
println("Spectral Radius: ", spectral_radius)