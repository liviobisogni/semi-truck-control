clear all, close all, clc

syms x1 x2 x3 x4 u1 u2 ...
     l1 l2 beta alpha real
% syms x_a y_a theta_a gamma real

% state
q = [x1 x2 x3 x4];
% q = [x y theta gamma];

% x1 = x_a;
% x2 = y_a;
% x3 = theta_a;
% x4 = gamma;


u = [u1;
     u2];

f = [0;
     0;
     0;
     0];

g_1 = [cos(x3 + beta);
       sin(x3 + beta);
       sin(x4 + beta - alpha)/(l1 * cos(x4 - alpha) + l2 * cos(alpha));
       0];
 
g_2 = [0;
       0;
       l2 * cos(alpha)/(l1 * cos(x4 - alpha) + l2 * cos(alpha));
       1];

g = [g_1    g_2];


% Affine-in-control form
pretty(f + g * u)

% Uscite
h_1 = x1;
h_2 = x2;
