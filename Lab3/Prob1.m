%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11 Dec 2025                                                                           %
% SS1 Lab 3 - Problem 1                                                                 %
% Fourier Transforms with Dirac                                                         %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Prob1() 
    clc();
    mainTask1();
end

function mainTask1()
    omega = 2 * pi * (0:0.01:100);          % frequency vector from 0 to 100 Hz
    T0 = 0;                                 % No delay
    T1 = 1e-3;                              % 1 ms delay 
    % Find the Fourier Transforms of δ(t) and δ(t - T1) and their spectra
    D0 = computeFT_diracPulse(omega, T0);
    [D0_magSpec, D0_phaseSpec] = getMagPhaseSpectra_fromFTVec(D0);
    D1 = computeFT_diracPulse(omega, T1);
    [D1_magSpec, D1_phaseSpec] = getMagPhaseSpectra_fromFTVec(D1);
    % Plot the magnitude and phase spectra for both Dirac pulses
    figure;
    subplot(2, 2, 1);
    plot(omega, D0_magSpec); 
    title('Magnitude Spectrum of δ(t)');
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    subplot(2, 2, 2);
    plot(omega, D0_phaseSpec, 'r'); 
    title('Phase Spectrum of δ(t)');
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
    subplot(2, 2, 3);
    plot(omega, D1_magSpec); 
    title(['Magnitude Spectrum of δ(t - T1) where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    subplot(2, 2, 4);
    plot(omega, D1_phaseSpec, 'r'); 
    title(['Phase Spectrum of δ(t - T1) where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
    % ------- Part D -------------------------------------------------------------------------------------------------------
    % Get the spectra for f(t) = δ(t - T1) + δ(t) using linearity property
    % and precalculations method
    [precalculatedMagSpec, precalculatedPhaseSpec] = getMagPhaseSpectra_precalculated(omega);
    FT_magSpec = D0_magSpec + D1_magSpec;
    FT_phaseSpec = D0_phaseSpec + D1_phaseSpec;
    
    figure;
    subplot(2, 2, 1);
    plot(omega, FT_magSpec); 
    title(['Magnitude Spectrum of f(t) = δ(t - T1) + δ(t) where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    
    subplot(2, 2, 2);
    plot(omega, FT_phaseSpec, 'r'); 
    title(['Phase Spectrum of f(t) = δ(t - T1) + δ(t)', ' where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
    
    subplot(2, 2, 3);
    plot(omega, precalculatedMagSpec); 
    title('Precalculated Magnitude Spectrum');
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    subplot(2, 2, 4);
    plot(omega, precalculatedPhaseSpec), 'r'; 
    title('Precalculated Phase Spectrum');
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
    % ------- Part E -------------------------------------------------------------------------------------------------------
    T2 = 2e-3;
    FT_2 = D1 + computeFT_diracPulse(omega, T2);
    [FT_2_magSpec, FT_2_phaseSpec] = getMagPhaseSpectra_fromFTVec(FT_2);
    figure;
    subplot(2, 2, 1);
    plot(omega, FT_magSpec); 
    title(['Magnitude Spectrum of f(t) = δ(t - T1) + δ(t) where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    subplot(2, 2, 2);
    plot(omega, FT_phaseSpec, 'r'); 
    title(['Phase Spectrum of f(t) = δ(t - T1) + δ(t) where T1=', num2str(T1), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
    
    subplot(2, 2, 3);
    plot(omega, FT_2_magSpec); 
    title(['Magnitude Spectrum of f(t) = δ(t - T1) + δ(t - T2) where T1=', num2str(T1), 's and T2=', num2str(T2), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude');
    ylim([0, 2]);
    grid on;
    subplot(2, 2, 4);
    plot(omega, FT_2_phaseSpec, 'r'); 
    title(['Phase Spectrum of f(t) = δ(t - T1) + δ(t - T2) where T1=', num2str(T1), 's and T2=', num2str(T2), 's']);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    grid on;
end

% returns the Fourier transform of a dirac pulse given the input angular
% frequency omega and time delay t0
function ftVec = computeFT_diracPulse(omega, t0)
    ftVec = exp(-1j * omega * t0);
end

function [magSpec, phaseSpec] = getMagPhaseSpectra_fromFTVec(ftVec) 
    magSpec = abs(ftVec);
    realPart = real(ftVec);
    imaginaryPart = imag(ftVec); 
    phaseSpec = atan2(imaginaryPart, realPart);
end

% computes the magnitude and phase spectra using the final simplified
% equations derived in the preparation
function [magSpec, phaseSpec] = getMagPhaseSpectra_precalculated(omega)
    t0 = 1e-3;                       % time delay of 1 ms
    magSpec = sqrt(2 + 2*cos(omega * t0));
    phaseSpec = (-omega * t0) / 2;
end