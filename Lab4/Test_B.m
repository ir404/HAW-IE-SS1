clc


% define the symbolic variables we need
syms s t Y y(t)


% define a string expression for the ODE
ode = diff(y, t, 2) + 2*diff(y, t) + y == sin(2*t);
% ode = 'D(D(y))(t) + 2*D(y)(t) + y(t) = sin(2*t)';

% compute the Laplace transform of the ODE
ltode = laplace(ode, t, s);
display(ltode);     % an algebraic expression for the unknown function ltode

% sub unknown function with Y for better readability and apply the initial 
% conditions: y(0) = -2 and y'(0) = 3
ltode = subs(ltode, laplace(y, t, s), Y);
ltode = subs(ltode, y(0), -2);                      % this handles y(0)
ltode = subs(ltode, subs(diff(y, t), t, 0), 3);     % this handles y'(0)

% solve the eqn to get the LT, Y
Y = solve(ltode, Y);
display(Y);

% invert Y to get y(t) in the time domain
y = ilaplace(Y, s, t);
display(y);


% verify solution
answ = diff(y, 2) + 2*diff(y, 1) + y;
display(answ);          % must be sin(2t)