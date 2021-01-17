clear;
close all;

% パラメータ
m1 = 1.5;
m2 = 6.4;
c1 = 50;
c2 = 15;
k1 = 2200;
k2 = 405;
Kp = 50; % 比例ゲイン
A = 0.003; % [mm]
Hz = 2*pi; % [rad/s]
t_end = 80;
cutoff_diff = 20;
T_diff = 1/(2*pi*cutoff_diff);

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

% シミュレーション実行
out = sim('IDCS_linear_nondamper.slx');

x = out.x;
r = out.r;
u = out.u;
in_rela = out.in_rela;
F_hard = out.F_hard;
F_ana = out.F_ana;

% --グラフ化--
figure(1);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2 - x_1', 'FontName', 'Cambria Math');
hold off;

% --グラフ化--
figure(2);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([6,8,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2 - x_1', 'FontName', 'Cambria Math');
hold off;

figure(3);
plot(u.Time(Start_Time:Finish_Time), u.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(in_rela.Time(Start_Time:Finish_Time), in_rela.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([6,8,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('A [mm]');
legend('u', 'x_0-x_2', 'FontName', 'Cambria Math');
hold off;

% figure(4);
% plot(F_hard.Time(Start_Time:Finish_Time), F_hard.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
% plot(F_ana.Time(Start_Time:Finish_Time), F_ana.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
% axis([0,8,-1,1]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('T [s]');
% % xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
% ylabel('Damper Force [N/m]');
% legend('Hardware', 'Analysis', 'FontName', 'Cambria Math');
% hold off;