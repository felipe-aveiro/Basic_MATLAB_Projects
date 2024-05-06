% Consider the following system:

% Transfer function G1(s) = 2s/(s+2)

% Transfer function G2(s) = (1/s)*exp(-0.2s)

% Combined system G(s) = (2s/(s+2))*((1/s)*exp(-0.2s))

% Resulting differential equation: dy[t]/dt + 2y[t] = 2x[t - 0.2], t >= 0

% Step response of the combined system solved analytically:

% y(t) = 
%{ 1 - exp(-2*[t - 0.2]), t >= 0.2;}
%{ 0, t < 0.2                      }

clear;
clc;

t = [0:0.005:10];  % vect t [0, 10] s w/ 0.005 step

figure(1); clf;  % create figure w/ id = 1

y = delayedFunction(t);
plot(t, y);
xlabel('Time [seconds]');
ylabel('Output');
title('Step response (analytical solution)');

axis([0,10,-0.5,1.5])
grid on;
pause(0.2)

% Step response of the combined system using the Control toolbox

figure(2); clf;

s = zpk('s'); % creates a variable s for use in a continuous-time zero-pole-gain model

G = (2*s/(s+2))*((1/s)*exp(-0.2*s)); % define Transfer function

step( G );
axis([0,10,-0.5,1.5])
grid on;
pause(0.2);


function y = delayedFunction(t)
    delay = 0.2;  % Specify the delay in seconds
    y = zeros(size(t));  % Initialize output to zeros
    y(t >= delay) = 1 - exp(-2 * (t(t >= delay) - delay));  % Calculate y[t] only for t >= 0.2
end
