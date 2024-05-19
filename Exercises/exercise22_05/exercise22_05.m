clc;
clear;

% Consider the following system:

% G'(s) = 1/(s(s+5)(s^2+2*s+5))
% &
% G(s) = K*G'(s)
% &
% With H(s) = 1

% a) Calculate the closed-loop transfer function

% Gclosed_loop(s) = G(s)/(1 + G(s)*H(s))
% Gclosed_loop(s) = G(s)/(1 + G(s))
% Gclosed_loop(s) = (K/(s(s+5)(s^2+2*s+5))/(1 + (K/(s(s+5)(s^2+2*s+5))))
% Gclosed_loop(s) = K/(s(s+5)(s^2+2*s+5) + K)

syms K;
syms s;
Gclosed_loop = K/(s*(s+5)*(s^2+2*s+5) + K)
pretty (Gclosed_loop)

% b) Find the interval of K values that makes the system stable

% By applying the Routh-Hurwitz stability criterion 

%  The Routh-Hurwitz stability criterion is a necessary (and frequently
%  sufficient) method to establish the stability of a single-input,
%  single-output(SISO), linear time invariant (LTI) control system.
%  More generally, given a polynomial, some calculations using only the
%  coefficients of that polynomial can lead us to the conclusion that it
%  is not stable.

e = str2sym('s^4 + 7*s^3 + 15*s^2 + 25*s +k')

syms s
e = coeffs(e,s,'all');

l=length(e);
m=mod(l,2);

if m==0
    a=sym(rand(1,(l/2)));
    b=sym(rand(1,(l/2)));

    for i=1:(l/2)
        a(i)=e((2*i)-1);
        b(i)=e(2*i);
    end

else

    e1=[e 0];
    a=sym(rand(1,((l+1)/2)));
    b=sym([rand(1,((l-1)/2)),0]);

    for i=1:((l+1)/2)
        a(i)=e1((2*i)-1);
        b(i)=e1(2*i);
    end

end

% Now we generate the remaining rows of the matrix

l1=length(a);
c=sym(zeros(l,l1));
c(1,:)=a;
c(2,:)=b;

for m=3:l

    for n=1:l1-1
        c(m,n)=-(1/c(m-1,1))*det([c((m-2),1) c((m-2),(n+1));c((m-1),1) c((m-1),(n+1))]);
    end

end

% Define symbolic variable
syms k real

% Define the Routh Matrix symbolically
c = [1, 15, k; 7, 25, 0; 80/7, k, 0; 25 - (49*k)/80, 0, 0; (k*(49*k - 2000))/(80*((49*k)/80 - 25)), 0, 0];

% Display the Routh Matrix
disp('The Routh Matrix:');
disp(c);

% Solve for k where the elements of the first column of c are greater than 0
ksol = solve(c(:,1) > 0, k, 'ReturnConditions', true);

% Display the stability conditions
disp('The conditions under which the system is stable are:');
disp(ksol.conditions);

pause(1)

stability_check_with_slider()

function stability_check_with_slider()
    % Create a figure for the step response plot
    fig1 = figure('Name', 'Step Response', 'NumberTitle', 'off', 'Position', [100, 100, 800, 400]);

    % Create a separate figure for the slider and text box
    fig2 = figure('Name', 'Stability Check with Slider', 'NumberTitle', 'off', 'Position', [100, 600, 800, 200]);

    % Define K as a local variable
    K = sym('K', 'real');

    % Define the Routh Matrix symbolically
    c = [1, 15, K; 7, 25, 0; 80/7, K, 0; 25 - (49*K)/80, 0, 0; (K*(49*K - 2000))/(80*((49*K)/80 - 25)), 0, 0];

    % Create a text box to display stability message
    textBox = uicontrol('Style', 'text', 'Position', [250, 120, 300, 30], 'HorizontalAlignment', 'center', ...
        'FontWeight', 'bold', 'FontSize', 12);

    % Create the slider
    slider = uicontrol('Parent', fig2, 'Style', 'slider', 'Min', 0, 'Max', 50, 'Value', 5, ...
        'Position', [250, 80, 300, 20], 'Callback', @update_stability);

    % Create a text label to show the slider value
    sliderLabel = uicontrol('Parent', fig2, 'Style', 'text', 'Position', [350, 50, 100, 20], ...
        'String', 'K = 5');

    % Initial stability check
    update_stability();

    function update_stability(~, ~)
        % Get the current value of K from the slider
        K_value = get(slider, 'Value');
        
        % Update the label text
        set(sliderLabel, 'String', ['K = ' num2str(K_value)]);

        % Substitute K with the specific value from the slider
        c_substituted = subs(c, K, K_value);

        % Convert to numeric
        c_numeric = double(c_substituted);

        % Perform the comparison on the first column
        if all(c_numeric(:,1) > 0)
            msg = 'System is Stable';
            color = 'g'; % green color
        else
            msg = 'System is Unstable';
            color = 'r'; % red color
        end
        
        % Display the result in the text box
        set(textBox, 'String', msg, 'ForegroundColor', color);

        % Clear the current axes
        figure(fig1); % Ensure the step response is plotted in fig1

        % Update the step response plot using the Control System Toolbox
        num = double(K_value);
        den = [1, 7, 15, 25, num];
        sys = tf(num, den);
        step(sys);
        grid ("on")
    end
end





