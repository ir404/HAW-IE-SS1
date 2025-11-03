%% SS1 Lab 1, Problem 3 - dealing with sums

sumA = 0;
sumB = 0;

for k = 1: 100
    sumA = sumA + k;
    sumB = sumB + (k * k);
end

fprintf('Sum of A: %d\n', sumA);
fprintf('Sum of B: %d\n', sumB);


% another way of doing calculating sums
sumA_alt = sum(1: 100);
sumB_alt = sum((1: 100).^2);    % create a row vector with values 1 to 100 and square each element