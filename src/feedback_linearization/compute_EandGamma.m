% Carico il modello
articulatedVehicle_mdl

q_dot = f + g * u;

h_1;                 % x
h_2;                 % y
h_1_dot = q_dot(1);  % u1*cos(beta + theta)
h_2_dot = q_dot(2);  % u1*sin(beta + theta)

syms a real     % a = u1_dot
q_temp = [q u1];
q_dot_temp = [q_dot' a];
h_1_dot_dot = simplify(jacobian(h_1_dot, q_temp) * simplify(q_dot_temp'));
h_2_dot_dot = simplify(jacobian(h_2_dot, q_temp) * simplify(q_dot_temp'));

E_1_1 = diff(h_1_dot_dot, a);
E_1_2 = diff(h_1_dot_dot, u2);
E_2_1 = diff(h_2_dot_dot, a);
E_2_2 = diff(h_2_dot_dot, u2);

E = [E_1_1 E_1_2;
     E_2_1 E_2_2]

G_1_1 = simplify(h_1_dot_dot - E_1_1 * a - E_1_2 * u2);
G_2_1 = simplify(h_2_dot_dot - E_2_1 * a - E_2_2 * u2);

Gamma = [G_1_1;
         G_2_1]


det_E = simplify(det(E))            % (l2*u1*cos(alpha))/(l2*cos(alpha) + l1*cos(alpha - x4))

sol = solve(det_E == 0, [x1 x2 x3 x4 u1 alpha beta])
sol.x1
sol.x2
sol.x3
sol.x4
sol.u1
sol.alpha
sol.beta


%% Check correttezza
ni = [h_1_dot_dot;
      h_2_dot_dot];

u_NEW = [a;
         u2];

isThisZero = simplify(ni - (Gamma + E * u_NEW))



%% nomenclatura: [x_a y_a theta_a gamma]
% E = [cos(beta + theta_a), -(l2*u1*sin(beta + theta_a)*cos(alpha))/(l2*cos(alpha) + l1*cos(alpha - gamma));
%      sin(beta + theta_a),  (l2*u1*cos(beta + theta_a)*cos(alpha))/(l2*cos(alpha) + l1*cos(alpha - gamma))];
% Gamma = [(u1^2*(cos(2*beta - alpha + gamma + theta_a) - cos(alpha - gamma + theta_a)))/(2*l2*cos(alpha) + 2*l1*cos(alpha - gamma));
%          (u1^2*(sin(2*beta - alpha + gamma + theta_a) - sin(alpha - gamma + theta_a)))/(2*l2*cos(alpha) + 2*l1*cos(alpha - gamma))];

%% nomenclatura: [x1 x2 x3 x4]
% E = [cos(beta + x3), -(l2*u1*sin(beta + x3)*cos(alpha))/(l2*cos(alpha) + l1*cos(alpha - x4));
%      sin(beta + x3),  (l2*u1*cos(beta + x3)*cos(alpha))/(l2*cos(alpha) + l1*cos(alpha - x4))];
% Gamma = [(u1^2*(cos(2*beta - alpha + x3 + x4) - cos(alpha + x3 - x4)))/(2*l2*cos(alpha) + 2*l1*cos(alpha - x4));
%          (u1^2*(sin(2*beta - alpha + x3 + x4) - sin(alpha + x3 - x4)))/(2*l2*cos(alpha) + 2*l1*cos(alpha - x4))];