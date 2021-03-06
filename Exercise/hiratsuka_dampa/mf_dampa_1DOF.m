clear;
close all;

% パラメータ(IDCS)
m1 = 1.5;%[kg]
k1 = 2200; % [N/m]
k2 = 405; % [N/m]
A = 0.003; % [mm]
Hz = 2*pi; % [rad/s]

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
First_Time = 0;
End_Time = 1;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

open_system('hiratsuka_dampa_1DOF.slx');
out = sim('hiratsuka_dampa_1DOF.slx');
close_system('hiratsuka_dampa_1DOF.slx');

input = out.input;
x = out.x;

% --グラフ化--
figure(1);
plot(input.Time(Start_Time:Finish_Time), input.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-4,4]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('A [mm]');
legend('input', 'FontName', 'Cambria Math');
hold off;