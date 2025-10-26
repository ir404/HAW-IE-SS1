%% SS1 Lab 1, Problem 6 - plotting cosine function

freq1 = 2;
freq2 = 5;
t = 0: 0.01: 2;

y1 = cos(2 * pi * freq1 * t);
y2 = cos(2 * pi * freq2 * t);

plot(t, y1);
title("Plot of y = cos(2πft) for frequencies f1 = 2Hz and f2 = 5Hz");
xlabel("t (s)");
ylabel("y = cos(2\pift)");
grid;
hold on;
plot(t, y2);
hold off;

legend("f1 = 2Hz", "f2 = 5Hz");