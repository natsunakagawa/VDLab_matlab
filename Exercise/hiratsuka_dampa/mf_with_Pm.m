clear;
close all;

% パラメータ(IDCS)
m1 = 1.5;% [kg]
m2 = 6.4; % [kg]
k1 = 2200; % [N/m]
k2 = 405; % [N/m]
c1 = 7; % [N/m]
c2 = 13; % [N/m]
A = 0.003; % [mm]
Hz = 2*pi; % [rad/s]
Kp = 200; % 比例ゲイン


% パラメータ(dampa) ------------------------------------------------------
Ao = (0.70*0.001)^2*pi/4;
Ar = 0.38*10^-6;
Aor = 0.1*10^-6;
Ap = (32.50*0.001)^2*pi/4;
kappaaa = 1.4-1.4*(Aor/Ap);
kappa = 1.4;
x0 = 0.042;
P0 = 101325;
row0 = 1.1841;
T = 0.005;
Cor = 0.8;
Fmax = 15;
Xmax = 0.004;
Vmax = 0.1;
B = 0;

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
orange = [255/255 165/255 0/255]; 
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];
springgreen = [0/255 255/255 154/255];

%　シミュレーション
First_Time = 5;
End_Time = 6;
Step_Time = 0.001;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;
Start_uTime = Start_Time;
Finish_uTime = (End_Time-0.9)/Step_Time + 1;


open_system('dampa_with_Pm.slx');
out = sim('dampa_with_Pm.slx');
% close_system('hiratsuka_dampa_1DOF.slx');