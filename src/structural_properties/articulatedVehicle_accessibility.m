% Carico il modello
articulatedVehicle_mdl

% Analisi di accessibilità

Delta0 = [g_1, g_2];
delta0 = {'g1' 'g2'};
dimDelta0 = rank(Delta0)

Delta = [g_1, g_2];
delta = {'g1' 'g2'};
dimDelta = rank(Delta)


%% Filtro
% Calcolo < Delta0, Delta >
Delta1 = [];
delta1 = {};
for i = 1:size(Delta0,2)                                 % ciclo sulle colonne di Delta0 : #campi vettoriali
    for j = 1:size(Delta,2)                              % ciclo sulle colonne di Delta
        lb = ['[' delta0{i} ',' delta{j} ']'];
        delta1 = [delta1, lb];
        Lb = jacobian(Delta(:,j),q)*Delta0(:,i) - jacobian(Delta0(:,i),q)*Delta(:,j);       % [g,f], [g,g]
        Delta1 = [Delta1, Lb];
    end
end

% Delta1 = Delta0 + < Delta0, Delta >
delta1 = [delta0, delta1];
Delta1 = simplify([Delta0, Delta1]);
dimDelta1 = rank(Delta1)

% Vettori linearmente indipendenti
delta1 = [delta1(:,1) delta1(:,2) delta1(:,4)]
Delta1 = [Delta1(:,1) Delta1(:,2) Delta1(:,4)]; % al posto di Delta2(:,4)], volendo: Delta2(:,5)]
Delta1 = simplify(Delta1)


%% Step2
% Calcolo < Delta1, Delta >
delta2 = {};
Delta2 = [];
for i = 1:size(Delta,2)
    for j = 1:size(Delta1,2)
        lb = ['[' delta{i} ',' delta1{j} ']'];
        delta2 = [delta2, lb];
        Lb = jacobian(Delta1(:,j),q)*Delta(:,i) - jacobian(Delta(:,i),q)*Delta1(:,j);
        Delta2 = [Delta2, Lb];
    end
end

% Delta2 = Delta1 + < Delta1, Delta >
delta2 = [delta1, delta2];
Delta2 = simplify([Delta1, Delta2]);
dimDelta2 = rank(Delta2)

% Vettori linearmente indipendenti
delta2 = [delta2(:,1) delta2(:,2) delta2(:,3) delta2(:,6)]
Delta2 = [Delta2(:,1) Delta2(:,2) Delta2(:,3) Delta2(:,6)];  % al posto di Delta2(:,6)], volendo: Delta2(:,9)]
Delta2 = simplify(Delta2)


%% Step3
% Calcolo < Delta2, Delta >
delta3 = {};
Delta3 = [];
for i = 1:size(Delta,2)
    for j = 1:size(Delta2,2)
        lb = ['[' delta{i} ',' delta2{j} ']'];
        delta3 = [delta3, lb];
        Lb = jacobian(Delta2(:,j),q)*Delta(:,i) - jacobian(Delta(:,i),q)*Delta2(:,j);
        Delta3 = [Delta3, Lb];
    end
end

% Delta3 = Delta2 + < Delta2, Delta >
delta3 = [delta2, delta3];
Delta3 = simplify([Delta2, Delta3]);
dimDelta3 = rank(Delta3)

% Vettori linearmente indipendenti
delta3 = [delta3(:,1:4)]
Delta3 = [Delta3(:,1:4)];
Delta3 = simplify(Delta3)


%% Solve
sol = solve(simplify(det(Delta3)) == 0, q, 'Real', true, 'ReturnConditions', true)
sol.x1
sol.x2
sol.x3
sol.x4


%% Verifico accessibilità nell'origine
x1 = 0; x2 = 0; x3 = 0; x4 = 0; u1 = 0; u2 = 0;
beta = 0; alpha = 0;
Delta3_q_eq = subs(Delta3)
rank(Delta3_q_eq)
