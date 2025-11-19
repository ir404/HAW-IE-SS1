% 19 Nov 2025
% SS1 Lab 2 - Problem 1
% Author: Imran Rizwan

clear();
clc();

% Parameters
N = 40;                                 % Number of Fourier series coefficients (k = 0,1,2,...,N)
f0 = 1;                                 % Fundamental frequency of the square wave [in Hz]
T0 = 1/f0;                              % Period
t = linspace(-2*T0, 2*T0);              % Vector defining time steps over 4 periods

% define the square function piecewise
f = @(t) (t >= 0 & t < T0/2).*1 + (t >= T0/2 & t < T0).*(-1);

% Compute Fourier coefficient a_k for k = 0,1,2,3,...,N
coefficent_a = zeros(1, N);
for k = 1 : N 
    coefficent_a(k) = (2/T0) * integral(@(t) f(t).* cos(k * (2*pi*f0) * t), 0, T0);
end

% Compute Fourier coefficient b_k for k = 1,2,...,N
coefficient_b = zeros(1, N); 
for k = 2 : N
    coefficient_b(k) = (2/T0) * integral(@(t) f(t).* sin(k * (2*pi*f0) * t), 0, T0);
end

% Compute the Fourier series representation of the square wave
fourierSeries = zeros(size(t));

