using DataInterpolations
using Plots

fn = x -> exp(x)
t = [0, 0.075, 0.25, 0.55, 0.7, 1]

function Linear(u,t)
    result = LinearInterpolation(fn.(t),t)
    plot(result, label="Linear Interpolation")
    plot!(t,fn.(t), seriestype=:scatter, label="Data", legend=:topleft, framestyle=:box)
end

function Quadratic(u,t)
    result = QuadraticInterpolation(fn.(t),t)
    plot(result, label="Quadratic Interpolation")
    plot!(t,fn.(t), seriestype=:scatter, label="Data", legend=:topleft, framestyle=:box)
end

function CS(u,t)
    result = CubicSpline(fn.(t),t)
    plot(result, label="Cubic Spline")
    plot!(t,fn.(t), seriestype=:scatter, label="Data", legend=:topleft, framestyle=:box)
end

function Lagrange(u,t)
    result = LagrangeInterpolation(fn.(t),t)
    plot(result, label="Lagrange Interpolation")
    plot!(t,fn.(t), seriestype=:scatter, label="Data", legend=:topleft, framestyle=:box)
end

# Linear(fn.(t),t)
# Quadratic(fn.(t),t)
# CS(fn.(t),t)
# Lagrange(fn.(t),t)


