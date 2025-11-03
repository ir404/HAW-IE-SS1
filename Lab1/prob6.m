%% SS1 Lab 1, Problem 6 - plotting cosine functions
% 29 Oct 2025 
% Mohamed Imran Mohamed Rizwan, 

freq1 = 2;
freq2 = 5;
t = 0: 0.01: 2;
t1 = 0: 0.01: 0.99;
t2 = 1: 0.01: 2;

y1 = cos(2 * pi * freq1 * t);

y2_1 = cos(2 * pi * freq1 * t1);
y2_2 = cos(2 * pi * freq2 * t2);
y2 = [y2_1 y2_2];

subplot(2, 1, 1);
plot(t, y1);
title("y = cos(2πft) for f = " + f1 + "Hz");
xlabel("t (s)");
ylabel("y = cos(2\pift)");
grid;
subplot(2, 1, 2);
plot(t, y2);

% legend("f1 = " + freq1 + "Hz", "f2 = " + freq2 + "Hz");