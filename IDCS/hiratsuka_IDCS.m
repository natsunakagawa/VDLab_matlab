clear;
close all;

% パラメータ
m1 = 1.5;%[kg]
m2 = 6.4;%[kg]
k1 = 2200; % [N/m]
k2 = 405; % [N/m]
c1 = 5; % [N/m]
c2 = 7; % [N/m]
A = 0.003; % [m]
Hz = 2*pi; % [rad/s]
Kp = 60; % 比例ゲイン
t_end = 100;
Cutoff_diff = 100;
T_diff = 1/(2*pi*Cutoff_diff);

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
End_Time = t_end;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;
Start_uTime = Start_Time;
Finish_uTime = (End_Time-0.9)/Step_Time + 1;

out = sim('IDCS_hiratsuka.slx');

x_IDCS = out.x_IDCS;
r_IDCS = out.r_IDCS;
x_rela = out.x_rela;
r_rela = out.r_rela;
u = out.u;
u_rela = out.u_rela;
X = out.X;
V = out.V;

% sin = out.sin;

% --グラフ化--
figure(1);
plot(r_IDCS.Time(Start_Time:Finish_Time), r_IDCS.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
% plot(x_IDCS.Time(Start_Time:Finish_Time), x_IDCS.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
% plot(r_rela.Time(Start_Time:Finish_Time), r_rela.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 2.0); hold on;
plot(x_rela.Time(Start_Time:Finish_Time), x_rela.Data(Start_Time:Finish_Time), 'color', lightblue, 'LineWidth', 2.0); hold on;
axis([6,8,-1,1]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0', '0.5', '1', '1.5', '2'});
ylabel('A [mm]');
hold off;

figure(2);
plot(u.Time(Start_Time:Finish_Time), u.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(u_rela.Time(Start_Time:Finish_Time), u_rela.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
% plot(r_rela.Time(Start_Time:Finish_Time), r_rela.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 2.0); hold on;
% plot(x_rela.Time(Start_Time:Finish_Time), x_rela.Data(Start_Time:Finish_Time), 'color', lightblue, 'LineWidth', 2.0); hold on;
axis([0,4,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0', '0.5', '1', '1.5', '2'});
ylabel('A [mm]');
hold off;


% figure(2);
% plot(X.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
% axis([-2,2,-5,5]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke[mm]');
% ylabel('DampingForce[N]');
% hold off;
% 
% figure(3);
% plot(V.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
% axis([-0.02,0.02,-5,5]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke Speed[m/s]');
% ylabel('DampingForce[N]');
% hold off;

% figure(4);
% plot(u_IDCS.Time(Start_Time:Finish_Time), u_IDCS.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
% plot(u_rela.Time(Start_Time:Finish_Time), u_rela.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
% axis([First_Time,End_Time,-2,2]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('T [s]');
% xticklabels({'0', '0.5', '1', '1.5', '2'});
% ylabel('u [mm]');
% legend('IDCS', 'relative', 'FontName', 'Cambria Math');
% hold off;