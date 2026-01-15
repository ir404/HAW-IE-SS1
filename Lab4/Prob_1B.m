%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 15 Jan 2026                                                                           %
% SS1 Lab 4 - Problem 1 (b)                                                             %
% Laplace Transforms                                                                    %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 

% define the symbolic variables we need
syms s t;

Y = laplace( (cos(2*t) + 2*sin(2*t)) * heaviside(t) );

display(Y);
pretty(Y);