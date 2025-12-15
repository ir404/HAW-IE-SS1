%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 15 Jan 2026                                                                           %
% SS1 Lab 4 - Problem 1 (c)                                                             %
% Laplace Transforms                                                                    %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;

% define the symbolic variables we need
syms s t;

F = 1 + (s / (s^2 + 9));

s = ilaplace(F, s, t);

fprintf("f(t) = \n")
pretty(s);