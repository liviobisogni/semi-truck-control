close all


%% ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
%                                INSTRUCTIONS
%__________________________________________________________________________
%
% It generates and (potentially) saves all the figures in the desired format.
%
saving_flag     = 0;                                                    % if '1', images (i.e., plots) are saved (as .png files);
                                                                        % otherwise, they ain't saved
title_flag      = 1;                                                    % if '1', titles are added to images;
                                                                        % otherwise, they ain't added
%
image_extension = 'pdf';                                                % pdf, png, ...
images_path     = '/Users/v/Documents/MATLAB/Tavole/Tavola_2/images';   % It is the folder where images will be saved.
                                                                        % *** !!! change this path if needed !!! ***
main_path       = '/Users/v/Documents/MATLAB/Tavole/Tavola_2';          % It is the folder containing the source code.
                                                                        % *** !!! change this path if needed !!! ***
%%_________________________________________________________________________



%% ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
%                            Graphics Parameters
%%_________________________________________________________________________
scaleFactor                 = 0.8;                  % font-scaling multiplicative factor
font_size_title             = 22 * scaleFactor;
font_size_XYlabel           = 22 * scaleFactor;
font_size_numbers_of_axes   = 13 * scaleFactor;
font_size_legend            = 14 * scaleFactor;
font_size_addedText         = 14 * scaleFactor;
plot_LineWidth              = 0.5;
%%_________________________________________________________________________


time            = out.ref.time;
%
out_x_a         = out.q_hat.signals.values(1:end,1);
out_x_a_ref     = out.ref.signals.values(1:end,1);
out_y_a         = out.q_hat.signals.values(1:end,2);
out_y_a_ref     = out.ref.signals.values(1:end,4);
%
out_theta_a     = out.q_hat.signals.values(1:end,3);
out_gamma       = out.q_hat.signals.values(1:end,4);
out_theta_p     = out.theta_p.signals.values(1,end);
%
out_x_p         = out.x_p.signals.values(1:end);
out_y_p         = out.y_p.signals.values(1:end);
%
out_v_a         = out.q_hat.signals.values(1:end,5); % u1
out_gamma_dot   = out.u_hat.signals.values(1:end,2); % u2

out_theta_a     = rad2deg(wrapToPi(out_theta_a));
out_gamma       = rad2deg(wrapToPi(out_gamma));
out_theta_p     = rad2deg(wrapToPi(out_theta_p));
out_gamma_dot   = rad2deg(wrapToPi(out_gamma_dot));

out_x_m         = out_x_a - l1 * cos(deg2rad(out_theta_a));
out_y_m         = out_y_a - l1 * sin(deg2rad(out_theta_a));


if (ref_traj == 1)
    trajectory = 'circle';
elseif (ref_traj == 2)
    trajectory = 'sigmoid';
else
    error('Invalid trajectory type. Possible values: ''1'' (circle) or ''2'' (sigmoid).');
end

if (saving_flag == 1)
    cd(images_path)
end



%% Plot x_a e y_a
figure('Renderer', 'painters', 'Position', [10 800 1000 564]);

% x_a
subplot(2, 1, 1)
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_x_a,'b', 'LineWidth', plot_LineWidth);
plot(time, out_x_a_ref,'r--', 'LineWidth', plot_LineWidth);
% plot(time, out_x_p, 'LineWidth', plot_LineWidth);               % rear position
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$x_a$ [m]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$x_a$', '$x_{a,d}$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.7, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.6, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

% y_a
subplot(2, 1, 2)
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_y_a,'b', 'LineWidth', plot_LineWidth);
plot(time, out_y_a_ref,'r--', 'LineWidth', plot_LineWidth);
% plot(time, out_y_p, 'LineWidth', plot_LineWidth);               % rear position
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$y_a$ [m]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$y_a$', '$y_{a,d}$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.7, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.6, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

if (title_flag == 1)
    ax = axes;
    t1 = title('\textbf{Front axle position}', 'FontSize', font_size_title, 'Interpreter', 'Latex');
    ax.Visible = 'off';
    t1.Visible = 'on';
end
if (saving_flag == 1)
    exportgraphics(gcf, [trajectory, '__Front_axle_position.', image_extension], 'BackgroundColor', 'white')
end



%% Plot Trajectory tracking
figure('Renderer', 'painters', 'Position', [10 800 1000 564]);

ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(out_x_a, out_y_a,'b', 'LineWidth', plot_LineWidth);
plot(out_x_a_ref, out_y_a_ref,'r--', 'LineWidth', plot_LineWidth);
plot(out_x_p, out_y_p, 'LineWidth', plot_LineWidth);                                % rear position
%
scatter(out_x_a(1), out_y_a(1), 'square', 'LineWidth', plot_LineWidth * 3);         % start
text(out_x_a(1), out_y_a(1), 'Start', 'Interpreter', 'latex', 'FontSize', font_size_addedText);
%
scatter(out_x_a(end), out_y_a(end), 'pentagram', 'LineWidth', plot_LineWidth * 3);  % finish
text(out_x_a(end), out_y_a(end), 'Finish', 'Interpreter', 'latex', 'FontSize', font_size_addedText);
%
ms_between_lines = 500;                             % [ms]
ccc = 1000 / ms_between_lines;
for i = 1 : length(time)-1
    if (time(i) == 0 || time(i) == time(end-1) || fix(ccc * time(i+1)) - fix(ccc * time(i)) == 1)
        % a
        scatter(out_x_a(i), out_y_a(i), 10, 'filled', 'b', 'LineWidth', plot_LineWidth/4);

        % l1
        xx_l1 = [out_x_a(i), out_x_m(i)];
        yy_l1 = [out_y_a(i), out_y_m(i)];
        line_l1 = line(xx_l1, yy_l1);
        line_l1.LineStyle = ':';

        % m
        scatter(out_x_m(i), out_y_m(i), 20, 'k', 'LineWidth', plot_LineWidth);

        % l2
        xx_l2 = [out_x_m(i), out_x_p(i)];
        yy_l2 = [out_y_m(i), out_y_p(i)];
        line_l2 = line(xx_l2, yy_l2);
        line_l2.Color = '[0.3010 0.7450 0.9330]';
        line_l2.LineStyle = ':';

        % p
        scatter(out_x_p(i), out_y_p(i), 10, 'filled', 'MarkerFaceColor', '[0.9290 0.6940 0.1250]', 'LineWidth', plot_LineWidth/4);
    end
end
%
xlabel('$x$ [m]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$y$ [m]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$(x_a(t),y_a(t))$', '$(x_{a,d}(t),y_{a,d}(t))$', '$(x_p(t),y_p(t))$', 'Start', 'Finish', '$(x_a(k),y_a(k))$', '$l_1$', '$(x_m(k),y_m(k))$', '$l_2$', '$(x_p(k),y_p(k))$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
axis equal
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.9, 0.6, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.9, 0.55, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

if (title_flag == 1)
    ax = axes;
    t1 = title('\textbf{Trajectory tracking}', 'FontSize', font_size_title, 'Interpreter', 'Latex');
    ax.Visible = 'off';
    t1.Visible = 'on';
end
if (saving_flag == 1)
    exportgraphics(gcf, [trajectory, '__Trajectory_tracking.', image_extension], 'BackgroundColor', 'white')
end



%% Plot Trajectory tracking error (e_x, e_y)
figure('Renderer', 'painters', 'Position', [10 800 1000 564]);

% e_x, e_y
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_x_a_ref - out_x_a,'b', 'LineWidth', plot_LineWidth);
plot(time, out_y_a_ref - out_y_a,'c', 'LineWidth', plot_LineWidth);
plot(time, zeros(length(time),1),'r--', 'LineWidth', plot_LineWidth);
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$x,y$ [m]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$e_x=x_{a,d}-x_a$', '$e_y=y_{a,d}-y_a$', 'Reference', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.85, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.8, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

if (title_flag == 1)
    ax = axes;
    t1 = title('\textbf{Trajectory tracking error}', 'FontSize', font_size_title, 'Interpreter', 'Latex');
    ax.Visible = 'off';
    t1.Visible = 'on';
end
if (saving_flag == 1)
    exportgraphics(gcf, [trajectory, '__Trajectory_tracking_error.', image_extension], 'BackgroundColor', 'white')
end



%% Plot v, gamma_dot, gamma
figure('Renderer', 'painters', 'Position', [10 800 1000 564]);

% v
subplot(3, 1, 1)
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_v_a,'b', 'LineWidth', plot_LineWidth);
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$v_a$ [m/s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$v_a$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.7, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.6, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

% gamma_dot
subplot(3, 1, 2)
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_gamma_dot,'b', 'LineWidth', plot_LineWidth);
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$\dot{\gamma}$ [$^\circ/$s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$\dot{\gamma}$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.7, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.6, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

% gamma
subplot(3, 1, 3)
ax = gca;
ax.XAxis.FontSize = font_size_numbers_of_axes;
ax.YAxis.FontSize = font_size_numbers_of_axes;
set(gca,'TickLabelInterpreter', 'latex')
hold on
grid on
%
plot(time, out_gamma,'b', 'LineWidth', plot_LineWidth);
%
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
ylabel('$\gamma$ [$^\circ$]', 'Interpreter','latex', 'FontSize', font_size_XYlabel)
legend('$\gamma$', 'Interpreter','latex', 'FontSize', font_size_legend)
%
txt_beta = ['$\beta =$ ', num2str(rad2deg(beta)), '$^\circ$'];
txt_alpha = ['$\alpha =$ ', num2str(rad2deg(alpha)), '$^\circ$'];
text(0.93, 0.7, txt_beta, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')
text(0.93, 0.6, txt_alpha, 'Interpreter', 'Latex', 'FontSize', font_size_addedText, 'Units','normalized')

if (title_flag == 1)
    ax = axes;
    t1 = title('\textbf{Control signals and articulated angle}', 'FontSize', font_size_title, 'Interpreter', 'Latex');
    ax.Visible = 'off';
    t1.Visible = 'on';
end
if (saving_flag == 1)
    exportgraphics(gcf, [trajectory, '__Control_signals_and_articulated_angle.', image_extension], 'BackgroundColor', 'white')
end



if (saving_flag == 1)
    cd(main_path)
end
