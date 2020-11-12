clc; close all;

%constants
Iyy = 2.186e8;  % [Slug-ft^2]
m = 38901;      % [Slug]
Tc = 2.361e6;   % [lbf]
V = 1347;       % [ft/s]
Cn_alpha = 0.1465;   %
g = 26.10;      % [ft/s^2]
N_alpha = 686819;    % [lbf/rad]
M_alpha = 0.3807;    % [s^-2]
M_delta = 0.5726;    % [s^-2]
x_cg = 53.19;    % [ft]
x_cp = 121.2;    % [ft]
F = Tc;

%Rocket Constraints
Mach = 1.4;           %speed
h = 34000;            %height
S = 116.2;            %Platform area
Fbase = 1000;         %Base drag
Ca = 2.4;             %Coefficient 
D = Ca*680*S - Fbase; %Drag
Drag = 7.15*D;        %Total Drag

%State space matrix

A_m = [ 0 1 0; M_alpha 0 M_alpha/V;
    -(F-Drag+N_alpha)/m 0 -N_alpha/(m*V)];
B_m = [0; M_delta; Tc/m ];
C_m = diag([1 1 1]);
D_m = [0;0;0];
pitch_ss = ss(A_m,B_m,C_m,D_m);
