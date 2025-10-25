%% SS1 Lab 1, Problem 4 - evaluating Taylor series

x = -pi / 2;
sum = 0; 

index = 1;
sign = 1;
summand = 1;
while abs(summand) > 10 ^ -8
    summand = (x ^ index) / factorial(index);
    sum = sum + sign * summand;
    index = index + 2;
    sign = -1 * sign;
end

fprintf("Evaluated sum = %f\n", sum);
fprintf("Last summand = %e\n", summand);
fprintf("Last index = %d\n", index);