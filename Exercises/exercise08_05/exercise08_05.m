clc;
% Consider the following system:

% G'(s) = (2(s+3))/(s(s+1)(s+6))
% &
% G(s) = K*G'(s)
% &
% With H(s) = 1


% a) Calculate the closed-loop transfer function

% Gclosed_loop(s) = G(s)/(1 + G(s)*H(s))
% Gclosed_loop(s) = G(s)/(1 + G(s))
% Gclosed_loop(s) = ((2*K*(s+3))/(s*(s+1)*(s+6)))/(1 + ((2*K*(s+3))/(s*(s+1)*(s+6))))
% Gclosed_loop(s) = (2*K*(s+3))/((s*(s+1)*(s+6)) + 2*K*(s+3))

syms s;
syms K;

Gclosed_loop = 2*K*(s+3) / (s^3 + 7*s^2 + (6 + 2*K)*s + 6*K)
pretty (Gclosed_loop)


% b) Considering K = 5, calculate this system's step response

K = 5
Gclosed_loop = 10*(s+3) / (s^3 + 7*s^2 + 16*s + 30)
pretty (Gclosed_loop)

% Y(s) = Gclosed_loop(s)*X(s)
% With X(s) = 1/s

% After manual manipulation:
% Y(s) = (4/21)/(s+5) + ((-25/21)*s - (30/21))/(s^2 + 2*s + 6) + 1/s

Y = (4/21)/(s+5) + ((-25/21)*s - (30/21))/(s^2 + 2*s + 6) + 1/s
pretty (Y)

% System's step response solved analytically:

% y(t) = (4/21)*exp(-5*t) + 1 - exp(-t)*((25/21)*cos(sqrt(5)*t) +
% (sqrt(5)/21)*sin(sqrt(5)*t))

syms t;
y = (4/21)*exp(-5*t) + 1 - exp(-t)*((25/21)*cos(sqrt(5)*t) + (sqrt(5)/21)*sin(sqrt(5)*t))
pretty (y)

% Numeric range for t
t_numeric = 0:0.005:6;  % vector t [0, 6] s with 0.005 step

% Substitute the numeric t values into the symbolic expression y and convert to double
y_numeric = double(subs(y, t, t_numeric));

figure(1); clf;  % create figure w/ id = 1

plot(t_numeric, y_numeric);
xlabel('Time [seconds]');
ylabel('Output');
title('Step response (analytical solution)');

grid on;
pause(0.2)



Gclosed_loop = tf([10, 30], [1, 7, 16, 30]);  % defines transfer function for k = 5 w/ Control Toolbox

figure(2); clf;

step (Gclosed_loop)

grid on;
pause(0.2);


