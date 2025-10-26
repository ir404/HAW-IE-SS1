%% SS1 Lab 1, Problem 7 - linear and log scales

RC = 10;
omega = linspace(0, 1000);

H = 1 ./ (1 + 1j * omega * RC);
H_mag = abs(H);

figure;
plot(omega, H_mag);
title("Frequency Response of an RC circuit (RC = 10s)");
subtitle("Linear Scale");
xlabel('Frequency \omega (rad/s)');
ylabel('Magnitude |H(j\omega)|');


A = 20 * log10(H_mag);
figure;
semilogx(omega, A);
subtitle("Log Frequency Scale");
xlabel('Frequency \omega (rad/s)');
ylabel('A(j\omega) (dB)');
grid on;