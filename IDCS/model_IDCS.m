clear;
close all;

% パラメータ(IDCS)
m1 = 1.5;
m2 = 6.4;
c1 = 5;
c2 = 7;
k1 = 2200;
k2 = 405;
A = 0.003; % [mm]
Hz = 2*pi; % [rad/s]
Kp = 100; % 比例ゲイン
t_end = 100;
Cutoff_diff = 100;
T_diff = 1/(2*pi*Cutoff_diff);

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
swt = 1; %入力変換スイッチ
First_Time = 0;
End_Time = t_end;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;
Start_uTime = Start_Time;
Finish_uTime = (End_Time-0.9)/Step_Time + 1;

out = sim('sim_IDCS.slx');

rela_1d = out.rela_1d;
rela_2d = out.rela_2d;
IDCS_1d = out.IDCS_1d;
IDCS_2d = out.IDCS_2d;
IDCS_1d1 = out.IDCS_1d1;
IDCS_1d2 = out.IDCS_1d2;
u = out.u;
u_rela = out.u_rela;
x = out.x;
r = out.r;
% sin = out.sin;

% --グラフ化--
figure(1);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([0,10,-15,15]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2 - x_1', 'FontName', 'Cambria Math');
hold off;

figure(2);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([6,8,-15,15]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
% xticklabels({'0.22', '0.23', '0.24', '0.25', '0.26'});
ylabel('SusStroke [mm]');
legend('-x''_1', 'x_2 - x_1', 'FontName', 'Cambria Math');
hold off;

figure(3);
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
% plot(IDCS_2d.Time(Start_Time:Finish_Time), IDCS_2d.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
% plot(IDCS_1d2.Time(Start_Time:Finish_Time), IDCS_1d2.Data(Start_Time:Finish_Time), 'color', lightblue, 'LineWidth', 2.0); hold on;
% plot(IDCS_1d1.Time(Start_Time:Finish_Time), IDCS_1d1.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 2.0); hold on;
% plot(IDCS_1d.Time(Start_Time:Finish_Time), IDCS_1d.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
% axis([First_Time,End_Time,-5,5]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('T [s]');
% % xticklabels({'0', '0.02', '0.04', '0.06', '0.08', '0.1'});
% ylabel('SusStroke [mm]');
% legend('x_2 - x_1', 'x''_2 - x''_1(Kp=5)', 'x''_2 - x''_1(Kp=50)', 'x''_2 - x''_1(Kp=500)', 'FontName', 'Cambria Math');
% hold off;
% 
% % figure(3);
% % plot(u_IDCS.Time(Start_Time:Finish_Time), u_IDCS.Data(Start_uTime:Finish_Time), 'color', blue, 'LineWidth', 1.0); hold on;
% % plot(u_rela.Time(Start_Time:Finish_Time), u_rela.Data(Start_uTime:Finish_Time), 'color', green, 'LineWidth', 1.0); hold on;
% % axis([First_Time+0.2, End_Time-0.7,-10,10]); grid on;
% % set(gca, 'FontName', 'Arial');
% % set(gca, 'FontSize', 14);
% % xlabel('T [s]');
% % xticklabels({'0', '0.02', '0.04', '0.06', '0.08', '0.1'});
% % ylabel('x [mm]');
% % legend('IDCS(x''_0)', 'relative(x_2 - x_0)', 'FontName', 'Cambria Math');
% % hold off;
% 
% % figure(6);
% % plot(x2.Time(50001:100001), x2.Data(50001:100001), 'color', blue, 'LineWidth', 2.0);
% % axis([50,100,-100,100]); grid on;
% % set(gca, 'FontName', 'Arial');
% % set(gca, 'FontSize', 14);
% % xlabel('T [s]');
% % ylabel('x [mm]');
