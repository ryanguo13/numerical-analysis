using LinearSystem

# 定义 ODE 方程
function ode(du, u, p, t)
    du[1] = u[1] + u[2]
    du[2] = u[1] - u[2]
end

# 定义初始条件
u0 = [1.0, 0.0]

# 定义时间范围
tspan = (0.0, 1.0)

# 使用 LinearSystem 模块解决 ODE
sol = solve(ode, u0, tspan)

# 绘制解
using Plots
plot(sol.t, sol.u)