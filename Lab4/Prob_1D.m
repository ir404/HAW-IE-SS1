%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 15 Jan 2026                                                                           %
% SS1 Lab 4 - Problem 1 (d)                                                             %
% Laplace Transforms                                                                    %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

% define the symbolic variables we need
syms s t Y y(t);

% define the ode given
ode = diff(y, 2) + 3*diff(y) + 2*y - exp(-t) * heaviside(t);


% transform the ode into the Laplace domain
lode = laplace(ode, t, s);

% sub unknown function with Y for better readability and apply the initial 
% conditions: y(0) = 0 and y'(0) = 0
eqn = subs(ltode, {laplace(y, t, s), y(0), diff(y)}, {Y, 0, 0});

% solve for Y
Y = solve(eqn, Y);

% invert Y to get y(t) in the time domain
y = ilaplace(Y, s, t);



fprintf("ODE: \n");
pretty(ode);

fprintf("Laplace ODE: \n");
pretty(lode);

fprintf("Eqn: \n");
pretty(eqn);

fprintf("Y in Laplace domain: \n");
pretty(Y);


fprintf("y in time domain: \n");
pretty(y);
