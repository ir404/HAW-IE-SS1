%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 19 Nov 2025                                                                           %
% SS1 Lab 2 - Problem 2                                                                 %
% Compute the Fourier series representation of a square waveform by                     %
% calculating the coefficients and summing them                                         %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear();
clc();

% Parameters
N = 200;                                % Number of Fourier series coefficients (k = 0,1,2,...,N)
f0 = 2;                                 % Fundamental frequency of the square wave [in Hz]
T0 = 1/f0;                              % Period
t = 0 : 0.0005 : 2*T0;                  % time vector over 2 periods

% define the square function piecewise
f = @(t) (t >= 0 & t < T0/2).*1 + (t >= T0/2 & t < T0).*(-1);

% Compute Fourier coefficient a_k for k = 0,1,2,3,...,N
coefficent_a = zeros(1, N);             % all zero as the square wave given in the task is odd

% Compute Fourier coefficient b_k for k = 1,2,...,N
coefficient_b = zeros(1, N); 
for k = 1 : N
    if (mod(k, 2) ~= 0)
        coefficient_b(k) = 4 / (pi * k);
    end
end

% Compute the Fourier series representation by adding each harmonic 
fourierSeries = zeros(size(t));
for k = 1 : N
    harmonic_k = coefficient_b(k) * sin(2*pi*f0 * k * t);       % a_k not added as its zero
    fourierSeries = fourierSeries + harmonic_k;
end             % cutoff freq is N * f0


figure

plot(t, fourierSeries);
titleStr = ['Fourier Series of a Square Wave | N = ', num2str(N), ', f0 = ' num2str(f0), ' Hz'];
title(titleStr);
ylabel('x(t)');
xlabel('t (s)');