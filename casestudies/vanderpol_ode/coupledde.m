%coupled de
%  https://uk.mathworks.com/help/symbolic/solve-a-system-of-differential-equations.html

% First, represent u and v by using syms to create the symbolic functions u(t) and v(t).
syms u(t) v(t)

% Define the equations using == and represent differentiation using the diff function.
ode1 = diff(u) == 3*u + 4*v;
ode2 = diff(v) == -4*u + 3*v;
odes = [ode1; ode2]

% odes(t) =
%  diff(u(t), t) == 3*u(t) + 4*v(t)
%  diff(v(t), t) == 3*v(t) - 4*u(t)
% Solve the system using the dsolve function which returns the solutions as elements of a structure.

S = dsolve(odes)



% S = 
%   struct with fields:
% 
%     v: [1×1 sym]
%     u: [1×1 sym]
% To access u(t) and v(t), index into the structure S.

uSol(t) = S.u
vSol(t) = S.v


% uSol(t) =
% C2*cos(4*t)*exp(3*t) + C1*sin(4*t)*exp(3*t)
% vSol(t) =
% C1*cos(4*t)*exp(3*t) - C2*sin(4*t)*exp(3*t)
% Alternatively, store u(t) and v(t) directly by providing multiple output arguments.


cond1 = u(0) == 0;
cond2 = v(0) == 1;
conds = [cond1; cond2];
[uSol(t), vSol(t)] = dsolve(odes,conds)




fplot(uSol, [-5 5])
hold on
fplot(vSol,  [-5 5])
grid on
legend('uSol','vSol','Location','best')