%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11 Dec 2025                                                                           %
% SS1 Lab 3 - Problem 2                                                                 %
% Convolutions                                                                          %
% Authors: Imran Rizwan 2778020, Lawrence Byabato 2778215, Gibriel Zibo 2778062         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Prob2() 
    clc();
    mainTask2();
end

function mainTask2
    n = 10;             % number of elements in the input signal x and impulse h
    
    % define a rectangular signal
    x = linspace(0, 0, n);
    x(2:5) = 1; % [0 1 1 1 1 0 0 0 0 0]
    
    % define an impulse vector
    h = linspace(0, 0, n);
    h(1) = 1;
    
    % perform convolution
    y = myConv(x, h);
    
    % plot x and y using subplot
    figure;
    subplot(4, 1, 1);
    stem(x, 'filled', 'g-o');
    title('Rectangular signal, x[n]');
    xlabel('Index'); 
    ylabel('Amplitude'); 
    grid on;
    ylim([0 1.5]);
    
    subplot(4, 1, 2);
    stem(y, 'filled');
    title('Convolved signal, y[n] with impulse signal given in part (b)');
    xlabel('Index'); 
    ylabel('Amplitude'); 
    grid on;
    ylim([0 2.5]);

    % ------- Part C ------------------------------------------------------------------------------------------------------------
    % define a new impulse vector and recalculte the convolution
    h = linspace(0, 0, n);
    h(3) = 1;
    y = myConv(x, h);
    
    subplot(4, 1, 3);
    stem(y, 'filled');
    title('Convolved signal, y[n] with impulse signal given in part (c)');
    xlabel('Index'); 
    ylabel('Amplitude'); 
    grid on;
    ylim([0 2.5]);

    % ------- Part D ------------------------------------------------------------------------------------------------------------
    % define a new impulse vector and recalculte the convolution
    h = linspace(0, 0, n);
    h(1) = 1;
    h(3) = 1;
    y = myConv(x, h);
    
    subplot(4, 1, 4);
    stem(y, 'filled');
    title('Convolved signal, y[n] with impulse signal given in part (d)');
    xlabel('Index'); 
    ylabel('Amplitude'); 
    grid on;
    ylim([0 2.5]);

end

function y = myConv(x, h)
    lenX = length(x);
    lenH = length(h);
    lenY = lenX + lenH - 1;         % calculate new length for Y
    
    % initialise output vector
    y = zeros(1, lenY);
    
    % the Convolution Loop
    % iterate through every point in 'y'
    for n = 1 : lenY
        % iterate through input 'x' to find overlapping points with 'h'
        for k = 1 : lenX
            h_index = n - k + 1;
            if (h_index > 0) && (h_index <= lenH)   % check that h_index is actually within the bounds of h
                y(n) = y(n) + x(k) * h(h_index);
            end
        end
    end
end