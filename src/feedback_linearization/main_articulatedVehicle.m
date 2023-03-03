close all; clear all; clc

%% SETTAGGIO PARAMETRI SIMULAZIONE

% Tempo di simulazione
timeSpan = 9;                                  % Duration  [s]
timeStep = 0.005;                               % Time step [s]
t = [0:timeStep:timeSpan]';


% Matrice guadagni per pole placement
lambda_1 = 4;
lambda_2 = 4;
lambda_3 = 4;
lambda_4 = 4;

K = [lambda_1   lambda_2    0           0;
     0          0           lambda_3    lambda_4];


% Configurazione iniziale
xa_0     = 1;                                   % [m]
ya_0     = -2;                                  % [m]
thetaa_0 = deg2rad(30);                         % [rad]
gamma_0  = deg2rad(0);                          % [rad]  
va_0     = 1;                                   % [m/s]
q_hat0   = [xa_0 ya_0 thetaa_0 gamma_0 va_0];

% Parametri
beta  = deg2rad(15);                            % [rad]
alpha = deg2rad(20);                            % [rad]
l1    = 2;                                      % [m]
l2    = 3;                                      % [m]

% Saturazione della velocità
min_v = 0;                                      % [m/s]
max_v = 15;                                     % [m/s]

% Saturazione di gamma (articulated angle)
min_gamma = deg2rad(-45);                       % [rad]
max_gamma = deg2rad(45);                        % [rad]

% Saturazione variazione di gamma
min_dgamma = deg2rad(-60);                      % [rad/s]
max_dgamma = deg2rad(60);                       % [rad/s]



% Trajectory Selector
% Possible values:
%                   1 - circonferenza
%                   2 - sigmoide (S-like)
ref_traj = 1;

if(ref_traj == 1)
    circonferenza
elseif (ref_traj == 2)
    sigmoide
else
    error('Invalid trajectory type. Possible values: ''1'' (circle) or ''2'' (sigmoid).');
end



%% SIMULAZIONE
tic
out = sim('Simulation_articulatedVehicle', 'StopTime', 'timeSpan');
toc



%% PLOT RISULTATI
plot_articulatedVehicle