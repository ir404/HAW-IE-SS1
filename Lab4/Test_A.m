%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 15 Jan 2026                                                                           %
% SS1 Lab 4 - Problem 1                                                                 %
% Laplace Transforms                                                                    %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms s t;
Y = laplace(t^3 * sin(2*t), t, s);
display(Y);
fprintf('\n');
pretty(Y)


fprintf('\n');
y = ilaplace(Y, s, t);
display(y);