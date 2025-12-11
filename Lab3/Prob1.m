%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11 Dec 2025                                                                           %
% SS1 Lab 3 - Problem 1                                                                 %
% .............                                                                         %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Prob1() 
    clear();
    clc();
    mainTask();
end

function mainTask()
    omega = 2 * pi * (0:0.01:100);          % frequency vector from 0 to 100 Hz
    T0 = 0;                                 % No delay
    T1 = 1e-3;                              % 1 ms delay 
end

function fourierTransform = computeFT_diracPulse(omega, t0)
    fourierTransform = 1 + exp(-1j * omega * t0);
end