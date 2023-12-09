clear;
clc;

% Constants
g = 9.8; 
R = 5; 


theta = 20 * pi/180; % (radians)
omega = sqrt(g/R);


dy = @(t,y) [y(2); -g/R * sin(y(1))];

% Initial conditions
y0 = [theta; 0];


tspan = [0, 3*2*pi];

% Solving the differential equation
[t,y] = ode45(dy, tspan, y0);

% Approximate solution
theta_approx = theta * cos(omega * t);

% Plotting the results
hold on;
plot(t, y(:,1), '-', 'LineWidth', 2);
plot(t, theta_approx, '^','LineWidth', 2);
xlabel('Time (s)');
ylabel('Phi (radians)');
title('Oscillation of a Skateboard');
legend({'Second derivative Phi', 'Phi(t)'});
grid on;
hold off;
disp([t, y(:,1)]);
