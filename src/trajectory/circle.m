x_a_r   = zeros(length(t),1);
dx_a_r  = zeros(length(t),1);
ddx_a_r = zeros(length(t),1);
y_a_r   = zeros(length(t),1);
dy_a_r  = zeros(length(t),1);
ddy_a_r = zeros(length(t),1);

A_x = 10;
A_y = 10;

omega_x = 0.2 * pi;
omega_y = 0.2 * pi;

phi_x = 0;
phi_y = pi/2;

offset_x = 0;
offset_y = 0;


for i = 1 : length(t)
    x_a_r(i)   = offset_x + A_x * cos(omega_x * t(i) + phi_x);
    dx_a_r(i)  = -A_x * omega_x * sin(omega_x * t(i) + phi_x);
    ddx_a_r(i) = -A_x * omega_x^2 * cos(omega_x * t(i) + phi_x);

    y_a_r(i)   = offset_y + A_y * cos(omega_y * t(i) + phi_y);
    dy_a_r(i)  = -A_y * omega_y * sin(omega_y * t(i) + phi_y);
    ddy_a_r(i) = -A_y * omega_y^2 * cos(omega_y * t(i) + phi_y);
end
