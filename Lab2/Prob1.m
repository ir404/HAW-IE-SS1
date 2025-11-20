%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 19 Nov 2025                                                                           %
% SS1 Lab 2 - Problem 1                                                                 %
% Decomposes a signal to its even and odd parts                                         %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear();
clc();

% A function to split a given function x to its even and odd parts
function [x_even, x_odd] = split_even_odd_parts(x)
    N = length(x);
    mid = (N + 1) / 2;                                  % mid index corresponds to t=0

    if (mod(N, 2) == 0)
        error("x should contain an odd length");
    else 
        % initialise vectors to hold the even and odd values of vector x
        x_even = zeros(size(x));
        x_odd = zeros(size(x));
    
        for k = 0 : (mid-1)
            t = mid + k;                % t  index
            neg_t = mid - k;            % -t index
            
            x_pos = x(t);                        
            x_neg = x(neg_t);
            
            x_even(t) = 0.5 * (x_pos + x_neg);
            x_even(neg_t) = x_even(t);

            x_odd(t) = 0.5 * (x_pos - x_neg);
            x_odd(neg_t) = -x_odd(t);
        end
    end
end


% ---------------------------------- Test Program ------------------------------------- 

% test funcion and relevant properties
N = 15;
mid = (N - 1) / 2;
t = -N : N;               % corresponds to the time values in the horizontal axis
x = zeros();
x(t == 0) = 0.5;
x(t > 0) = 1;

[x_even, x_odd] = split_even_odd_parts(x);
sum_even_odd = x_even + x_odd;


figure;

subplot(4,1,1)
stem(t, x, 'r-o')
axis([min(t) max(t) min(x) max(x)])
set(gca, 'XTick', t);
title('Original Signal');
ylabel('x(t)');
xlabel('t');

subplot(4,1,2)
stem(t, x_even, 'g-o')
% axis([min(t) max(t) min(x_even) max(x_even)]);
set(gca, 'XTick', t);
title('Even Part');
ylabel('x_e(t)');
xlabel('t');

subplot(4,1,3)
stem(t, x_odd, 'b-o')
axis([min(t)-1 max(t)+1 min(x_odd) max(x_odd)])
set(gca, 'XTick', t);
title('Odd Part');
ylabel('x_o(t)');
xlabel('t');

subplot(4,1,4)
stem(t, sum_even_odd, 'y-o')
axis([min(t) max(t) min(sum_even_odd) max(sum_even_odd)])
set(gca, 'XTick', t);
title('Sum of Even + Odd')
ylabel('x_e(t) + x_o(t)');
xlabel('t');

