R       = 20;
alpha_l = 12;
c       = 10;

x_a_r = t * 2 * R/timeSpan;

dx_a_r  = zeros(length(x_a_r),1);
ddx_a_r = zeros(length(x_a_r),1);

dx_a_r(1) = 0;
for ii = 2 : length(x_a_r)
    dx_a_r(ii) = (x_a_r(ii) - x_a_r(ii - 1)) / timeStep;
end


%% PDR Model Equation
y_a_r = c * (exp(-log(2) * (x_a_r / R).^alpha_l) - 1);
dy_a_r = -(alpha_l * c * log(2) * 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r/R).^alpha_l)./x_a_r;
ddy_a_r = c * ((alpha_l .* log(2) .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^alpha_l)./x_a_r.^2 + (alpha_l.^2 * log(2).^2 .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^(2 .* alpha_l - 1))./(R .* x_a_r) - (alpha_l^2 * log(2) .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^(alpha_l - 1))./(R .* x_a_r));

%% Reversed curve (bottom to top)
% y_a_r = c * (1 - exp(-log(2) * (x_a_r / R).^alpha_l));
% dy_a_r = +(alpha_l * c * log(2) * 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r/R).^alpha_l)./x_a_r;
% ddy_a_r = -c * ((alpha_l .* log(2) .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^alpha_l)./x_a_r.^2 + (alpha_l.^2 * log(2).^2 .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^(2 .* alpha_l - 1))./(R .* x_a_r) - (alpha_l^2 * log(2) .* 2.^(-(x_a_r./R).^alpha_l) .* (x_a_r./R).^(alpha_l - 1))./(R .* x_a_r));


dy_a_r(1) = 0;
ddy_a_r(1) = 0;
