%%% ADEM Fourier Series %%%
clear
close all;
clc;
syms t 
syms n

%%% Defining Variables %%%
T = 2*pi; %%Period
P = 50; %%Number of points recorded.
i = 0;


%%% Function definition %%%
fun_yt = @(t) -2*t.^2; %% Function the fourier should be found for.
i_a0 = integral(fun_yt, -pi, pi); %%Finding the integral from -pi to pi.


%%% Fourier simulation %%%
for t = linspace(-T, T, P)
    i = i + 1; time(i) = t;
    
    y(i) = -2*t^2;
    
    a0 = 1/(2*pi) * i_a0;
    %b_n and the general formula for a_n were found by hand: 
    a_n = (-4*pi.^2*sin(pi*n)*n^2 - 8*n*cos(pi*n)*pi + 8*sin(pi*n))/(pi*n.^3);
    b_n = 0;
    
    zig = (a_n*cos(n*t)+b_n*sin(n*t));
    f(i) = a0 + symsum(zig, n, 1, 1); %%Fundamental frequency N = 1
    g(i) = a0 + symsum(zig, n, 1, 5) ; %%N=5
    h(i) = a0 + symsum(zig, n, 1, 15); %%N=15
end    


%%% Fourier plot %%%
figure(1)
clf %%Clearing the current figure window when the program is run.
figure(1)
hold on
plot(time, y, 'r', 'Linewidth', 1)
plot(time, f, 'b', 'Linewidth', 1)
plot(time, g, 'g', 'Linewidth', 1)
plot(time, h, 'm', 'Linewidth', 1)

title('Fourier Series of function y(t) = -2*t^2')
legend('y(t): -2t^2', 'N=1 (Fundamental Freq.)', 'N=5', 'N=15')
grid on;
xlabel('Frequency')
xlim([-T T])
ylim([-25 5])






