clear;
close all;

% パラメータ(IDCS)
m1 = 1.5;
m2 = 6.4;
c1 = 50;
c2 = 15;
k1 = 2200;
k2 = 405;
A = 0.003; % [mm]
Hz =2*pi; % [rad/s]
Kp = 50; % 比例ゲイン
t_end = 100;
diff_cutoff = 20;
T_diff = 1/(2*pi*diff_cutoff);

% パラメータ(dampa) ------------------------------------------------------
phase_lag = pi/2; % [rad}
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
Step_Time = 0.004;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

out = sim('IDCS_nonlinear_damper.slx');

x = out.x;
r = out.r;
u_rela = out.u_rela;
u = out.u;
F_hard = out.F_hard;
F_analysis = out.F_analysis;

% --グラフ化--
figure(1);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-3,3]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2-x_1', 'FontName', 'Cambria Math');
hold off;

% --グラフ化--
figure(2);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([6,8,-3,3]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2-x_1', 'FontName', 'Cambria Math');
hold off;

figure(3);
plot(u.Time(Start_Time:Finish_Time), u.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(u_rela.Time(Start_Time:Finish_Time), u_rela.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([6,8,-3,3]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('A [mm]');
legend('u', 'x_0-x_2', 'FontName', 'Cambria Math');
hold off;

% figure(4);
% plot(F_hard.Time(Start_Time:Finish_Time), F_hard.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
% plot(F_analysis.Time(Start_Time:Finish_Time), F_analysis.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
% axis([6,8,-6,6]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('T [s]');
% % xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
% ylabel('Dnamper force [N]');
% legend('Hardware', 'Analysis', 'FontName', 'Cambria Math');
% hold off;