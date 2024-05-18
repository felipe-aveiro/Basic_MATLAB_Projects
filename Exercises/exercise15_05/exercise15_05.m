clc;
% Consider the following system:

% G(s) = 12/((s+2)^2)
% &
% With H(s) = 1

% a) Calculate the closed-loop transfer function

% Gclosed_loop(s) = G(s)/(1 + G(s)*H(s))
% Gclosed_loop(s) = G(s)/(1 + G(s))
% Gclosed_loop(s) = (12/((s+2)^2))/(1 + (12/((s+2)^2)))
% Gclosed_loop(s) = 12/(s^2 + 4*s + 16)

syms s;

% Gclosed_loop = 12/(s^2 + 4*s + 16)
Gclosed_loop = (3/4)* 16/(s^2 + 4*s + 16) % this transfer function is now in the format of 2nd order system
pretty (Gclosed_loop)

% b) Calculate this system's step response

% Y(s) = Gclosed_loop(s)*X(s)
% With X(s) = 1/s

% Therefore:
% Y(s) = ((3/4)* 16/(s^2 + 4*s + 16))*(1/s)

Y = ((3/4)* 16/(s^2 + 4*s + 16))*(1/s)
pretty (Y)

% System's step response solved analytically:

% y(t) = (3/4)*(1 - 1/(sqrt(3/4))*exp(-2*t)*sin(2*sqrt(3)*t + pi/3))

syms t;

y = (3/4)*(1 - 1/(sqrt(3/4))*exp(-2*t)*sin(2*sqrt(3)*t + pi/3))
pretty (y)

% Numeric range for t
t_numeric = 0:0.005:3;  % vector t [0, 3] s with 0.005 step

% Substitute the numeric t values into the symbolic expression y and convert to double
y_numeric = double(subs(y, t, t_numeric));

figure(1); clf;  % create figure w/ id = 1

plot(t_numeric, y_numeric);
xlabel('Time [seconds]');
ylabel('Output');
title('Step response (analytical solution)');

grid on;
pause(0.2)


Gclosed_loop = tf([12], [1, 4, 16]); % defines transfer function w/ Control Toolbox

figure(2); clf;

step (Gclosed_loop)

grid on;
pause(0.2);