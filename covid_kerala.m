clear all;

%% Parameters
Pre_infec = 5.2;
f = 1/Pre_infec;

Duration = 7;
r=1/Duration;

R_0 = 2.2; % A single infected person will infect about 2.2 others in a totally susceptible population

N = 6.41e+7; % Population of  
beta = R_0/(N*Duration*0.55);


%% Differential equations

%Change me
tspan1 = 0:1:14; % Before policy
y0 = [N-288, 0, 21, 3,1]; % Coronavirus count 

[t,y]=ode45(@(t,y) ode_fun_simple(t,y,beta), tspan1, y0);
% ode45 is a built in Numerical Differential Equations solver in MATLAB.
% There are packages for this solver in other programming languages.

y_2nd = [y(end,1), y(end,2), y(end,3), y(end,4), y(end,5)];
%Change me
tspan2 = 15:1:300;

[t,y2]=ode45(@(t,y) ode_fun_simple(t, y, beta/4.4), tspan2, y_2nd);

y_combined = [y;y2];

%%
plot(0:1:300,y_combined,'LineWidth', 1.5, 'MarkerSize', 18)
legend('S','E','I','R','D', 'Location', 'Best')
xlabel('Days after March 22, 2020')
ylabel('Population')
title('Predicted Spread of COVID-19 in Karnataka')
grid on;
grid minor;
set(gca, 'FontSize', 26)