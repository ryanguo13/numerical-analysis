using LinearAlgebra
using Plots

# ==============================
# Jacobi linear solver algorithm
# ==============================
function jacobi_solve(A::Matrix{Float64}, b::Vector{Float64}, 
    x0::Vector{Float64}, tol::Float64,
    zeroTolerance::Float64, max_iters::Int)
    
    # Number of unknowns
    # ------------------
    n = length(b)
    
    # Check for near-zero diagonal entries
    # ------------------------------------
    if any(abs.(diag(A)) .< zeroTolerance)
        error("Near-zero diagonal entry found in the matrix.")
    end

    # Solution vector initialisation
    # ------------------------------
    x = copy(x0)
    x_new = zeros(n)

    # Plot vector initialisation
    # --------------------------
    errors = Float64[]
    
    # Perform iteration
    # -----------------
    for iter = 1:max_iters
        # Loop rows
        for i = 1:n
            x_new[i] = (b[i] - dot(A[i, :], x) + A[i, i] * x[i]) / A[i, i]
        end
        
        # Evaluate error
        err = norm(x_new - x)
        push!(errors, err)  # Store the current error

        # Check for convergence
        if err < tol
            return x_new, iter, errors
        end

        # Update the solution vector
        x .= x_new
    end
    
    error("Maximum number of iterations reached without convergence.")
end

# =============
# Problem setup
# =============

# A = [4.0 1.0 2.0; 3.0 5.0 1.0; 1.0 1.0 3.0]
# b = [1.0; -2.0; 0.0]

## the following matrix is from the turorial 

A = [3.0 1.0 -1.0; 2.0 4.0 1.0; -1.0 2.0 5.0];
b = [4.0; 1.0; 1.0]

x0 = zeros(length(b)) # Initial guess for solution vector 

# ==================
# Numerical settings
# ==================
tolerance = 1E-8
zeroTolerance = 1E-12
iterMax = 500

# =====
# Solve
# =====
try
    x, niter, errors = jacobi_solve(A, b, x0, tolerance, zeroTolerance, iterMax)
    println("Converged in $niter iterations. Solution: $x")

    # Plotting error vs iteration number
    plot(1:niter, errors, yscale=:log10, xlabel="Iteration Number", ylabel="Error (log scale)", title="Convergence of Jacobi Method", legend=false, line=:line, marker=:circle)
    
catch error
    println(error)
end