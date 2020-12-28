clear;
close all;

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

% パラメータ
A = 0.007; % [m]
Hz = 2*3*pi; % [rad/sec]
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
t_end = 40;

%　グラフ時間
First_Time = 0;
End_Time = t_end;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;


%　シミュレーション実行
out = sim('hiratsuka_dampa_sim.slx');

% -- to workspace --
F = out.F;
X = out.X;
V = out.V;

% --グラフ化--
% figure(1);
% plot(X.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);hold on;
% % A=0.007;
% % out = sim('hiratsuka_dampa_sim.slx');
% % plot(out.X.Data(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 1.0);hold on;
% % A=0.01;
% % out = sim('hiratsuka_dampa_sim.slx');
% % plot(out.X.Data(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 1.0);hold on;
% axis([-12,12,-40,40]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke[mm]');
% ylabel('DampingForce[N]');
% % legend('3[mm]', '7[mm]', '10[mm]', 'FontName', 'Cambria Math');
% hold off;

% figure(2);
% plot(V.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);hold on;
% % A = 0.007;
% % out = sim('hiratsuka_dampa_sim.slx');
% % plot(out.V.Data(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 1.0);hold on;
% % A = 0.01;
% % out = sim('hiratsuka_dampa_sim.slx');
% % plot(out.V.Data(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 1.0);hold on;
% axis([-0.1,0.1,-40,40]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke Speed[m/s]');
% ylabel('DampingForce[N]');
% hold off;

figure(3);
plot(out.F.Time(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);hold on;
% A=0.007;
% out = sim('hiratsuka_dampa_sim.slx');
% plot(out.F.Time(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 1.0);hold on;
% A=0.01;
% out = sim('hiratsuka_dampa_sim.slx');
% plot(out.F.Time(Start_Time:Finish_Time), out.F.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 1.0);hold on;
axis([First_Time,End_Time,-35,35]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T[s]');
ylabel('DampingForce[N]');
legend('3[mm]', '7[mm]', '10[mm]', 'FontName', 'Cambria Math');
hold off;
