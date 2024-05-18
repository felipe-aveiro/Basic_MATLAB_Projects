 %step response of G(s) = 1/((s+1)*(s+2))
clear;
clc;

t = [0:0.005:7];  %vect t [0, 7] s w/ 0.005 step

figure(1); clf;   %create figure w/ id = 1

plot(t, -exp(-t), 'b')   %plot individual terms of the response defined using the Laplace transforms
hold on;

plot(t, 1/2*exp(-2*t), 'r')

plot(t, 1/2, 'g')

plot(t, -exp(-t)+1/2*exp(-2*t)+1/2, 'm')

axis([0,7,-1,1])
grid on;
pause(0.2)

G = tf(1, [1 3 2]);   %transfer function

figure(2); clf;
step( G );   %step response of the transfer function
axis([0,7,-1,1])
grid on;
pause(0.2)


