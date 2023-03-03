% Carico il modello
articulatedVehicle_mdl

%% dh_1 dh_2
dh_1 = jacobian(h_1, q);                            % [1 0 0 0]
dh_2 = jacobian(h_2, q);                            % [0 1 0 0]

% Codistribuzione di osservabilità
dO = [dh_1; dh_2]


%% Calcolo i vari dLg_1 h_i, i = 1,2
Lg_1h_1 = jacobian(h_1,q) * g_1;
Lg_1h_2 = jacobian(h_2,q) * g_1;
dLg_1h_1 = jacobian(Lg_1h_1, q);     % [0, 0, -sin(beta + x3), 0]
dLg_1h_2 = jacobian(Lg_1h_2, q);     % [0, 0, cos(beta + x3), 0]

dO = [dO; dLg_1h_2]


%% Calcolo i vari dLg_2 h_i, i = 1,2
Lg_2h_1 = jacobian(h_1,q) * g_2;
Lg_2h_2 = jacobian(h_2,q) * g_2;
dLg_2h_1 = jacobian(Lg_2h_1, q);     % [0, 0, 0, 0]
dLg_2h_2 = jacobian(Lg_2h_2, q);     % [0, 0, 0, 0]


%% Calcolo i vari dLf h_i, i = 1,2
Lfh_1 = jacobian(h_1,q) * f;
Lfh_2 = jacobian(h_2,q) * f;
dLfh_1 = jacobian(Lfh_1, q);     % [0 0 0 0]
dLfh_2 = jacobian(Lfh_2, q);     % [0 0 0 0]

dLfh_i = [dLfh_1; dLfh_2];
rank([dO; dLfh_i])                                   % Non sono L.I. coi precedenti --> ne serve ancora 1


%% Calcolo i vari dLg_1 Lg_1 h_i, i = 1,2
Lg_1Lg_1h_1 = jacobian(Lg_1h_1,q) * g_1;
Lg_1Lg_1h_2 = jacobian(Lg_1h_2,q) * g_1;
%
dLg_1Lg_1h_1 = jacobian(Lg_1Lg_1h_1, q);       % [0, 0, -(sin(beta - alpha + x4)*cos(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4)), (l1*sin(alpha - x4)*sin(beta - alpha + x4)*sin(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4))^2 - (cos(beta - alpha + x4)*sin(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4))]
dLg_1Lg_1h_2 = jacobian(Lg_1Lg_1h_2, q);       % [0, 0, -(sin(beta - alpha + x4)*sin(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4)), (cos(beta - alpha + x4)*cos(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4)) - (l1*sin(alpha - x4)*sin(beta - alpha + x4)*cos(beta + x3))/(l2*cos(alpha) + l1*cos(alpha - x4))^2]
rank([dO; dLg_1Lg_1h_1]);
rank([dO; dLg_1Lg_1h_2])

dO = [dO; dLg_1Lg_1h_2]     % OK !


det_dO = simplify(det(dO))
sol = solve(det_dO == 0, q)


%% Check di perdita di osservabilità nell'intorno dell'origine
% Origine è pt di equilibrio in quanto f(q_eq, u_eq) = f(0,0) = 0
% q_eq = [0 0 0 0];
% u_eq = [0 0];

% Verifica origine pt equilibrio
x1 = 0; x2 = 0; x3 = 0; x4 = 0; u1 = 0; u2 = 0;
% x1 = 1; x2 = 2; x3 = pi/2 - beta; x4 = 4; u1 = 0; u2 = 0;     % perde rango

% Valuto dO
dO_q_eq = eval(dO)
rg_dO_q_eq = rank(dO_q_eq)
