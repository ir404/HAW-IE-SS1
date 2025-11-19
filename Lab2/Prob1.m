% 19 Nov 2025
% SS1 Lab 2 - Problem 1
% Author: Imran Rizwan

clear();
clc();

function [x_even, x_odd] = split_even_odd_parts(x)
    N = length(x);
    mid = (N + 1) / 2;                                  % mid index corresponds to t=0

    % initialise vectors to hold the even and odd values of vector x
    x_even = zeros(size(x));
    x_odd = zeros(size(x));

    for k = 0 : (mid-1)
        t = mid + k;
        neg_t = mid - k;
        x_pos = x(t);                        
        x_neg = x(neg_t);
        x_even(t) = 0.5 * (x_pos + x_neg);
        x_even(neg_t) = x_even(t);
        x_odd(t) = 0.5 * (x_pos - x_neg);
        x_odd(neg_t) = -x_odd(t);
    end
end

x = [-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7];
[x_even, x_odd] = split_even_odd_parts(x);
sum_even_odd = x_even + x_odd;

% Display the results
disp('Even Part:');
disp(x_even);
disp('Odd Part:');
disp(x_odd);
totalSum = sum(x);
disp('Sum of even and odd parts:');
disp(sum_even_odd);

% Plot x, x_even, x_odd and sum_even_odd in subplots
figure;

subplot(4, 1, 1);
plot(x, 'b-o');
title('Original Signal');
xlabel('Index');
ylabel('Amplitude');

subplot(4, 1, 2);
plot(x_even, 'g-o');
title('Even Part');
xlabel('Index');
ylabel('Amplitude');

subplot(4, 1, 3);
plot(x_odd, 'r-o');
title('Odd Part');
xlabel('Index');
ylabel('Amplitude');

subplot(4, 1, 4);
plot(sum_even_odd, 'y-o');
title('Sum of Even and Odd Parts');
xlabel('Index');
ylabel('Amplitude');


