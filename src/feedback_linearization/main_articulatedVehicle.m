close all; clear all; clc

%% ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
%                       SIMULATION PARAMETERS SETTING
%__________________________________________________________________________
% Simulation time
timeSpan = 9;                                   % Duration  [s]
timeStep = 0.005;                               % Time step [s]
t = [0:timeStep:timeSpan]';


% Gain matrix for pole placement
lambda_1 = 4;
lambda_2 = 4;
lambda_3 = 4;
lambda_4 = 4;

K = [lambda_1   lambda_2    0           0;
     0          0           lambda_3    lambda_4];


% Initial configuration (q_hat0   = [xa_0 ya_0 theta_0 gamma_0 va_0])
xa_0    = 1;                                    % [m]
ya_0    = -2;                                   % [m]
theta_0 = 30;                                   % [°]
gamma_0 = 0;                                    % [°]  
va_0    = 1;                                    % [m/s]

% Geometric parameters
beta  = 15;                                     % [°]
alpha = 20;                                     % [°]
l1    = 2;                                      % [m]
l2    = 3;                                      % [m]

% Velocity saturation
min_v = 0;                                      % [m/s]
max_v = 15;                                     % [m/s]

% Gamma (articulated angle) saturation
min_gamma = -45;                                % [°]
max_gamma = 45;                                 % [°]

% Gamma variation saturation
min_dgamma = -60;                               % [°/s]
max_dgamma = 60;                                % [°/s]

% Trajectory Selector
% Possible values:
%                   1 - circle
%                   2 - sigmoid (S-like)
ref_traj = 1;
%%_________________________________________________________________________





%% Convert deg to rad
theta_0    = deg2rad(theta_0);                  % [rad]
gamma_0    = deg2rad(gamma_0);                  % [rad]  
beta       = deg2rad(beta);                     % [rad]
alpha      = deg2rad(alpha);                    % [rad]
min_gamma  = deg2rad(min_gamma);                % [rad]
max_gamma  = deg2rad(max_gamma);                % [rad]
min_dgamma = deg2rad(min_dgamma);               % [rad/s]
max_dgamma = deg2rad(max_dgamma);               % [rad/s]

% Initial configuration
q_hat0   = [xa_0 ya_0 theta_0 gamma_0 va_0];



if(ref_traj == 1)
    circle
elseif (ref_traj == 2)
    sigmoid
else
    error('Invalid trajectory type. Possible values: ''1'' (circle) or ''2'' (sigmoid).');
end



%% Simulation
tic
out = sim('Simulation_articulatedVehicle', 'StopTime', 'timeSpan');
toc



%% Plot
plot_articulatedVehicle
