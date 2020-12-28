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
Hz = 2*1*pi; % [rad/s]
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
First_Time = 6;
End_Time = 8;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

open_system('feedback_relative.slx');
out = sim('feedback_relative.slx');
close_system('feedback_relative.slx');

r = out.r;
x = out.x;
F = out.F;
X = out.X;
V = out.V;

% --グラフ化--
figure(1);
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([6,8,-5,5]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
xticklabels({'0', '0.5', '1','1.5', '2'});
ylabel('A [mm]');
legend('x_2-x_1', '-x''_1',  'FontName', 'Cambria Math');
hold off;

% figure(2);
% plot(X.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
% axis([-1,1,-2,2]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke[mm]');
% ylabel('DampingForce[N]');
% hold off;
% 
% figure(3);
% plot(V.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
% axis([-0.01,0.01,-2,2]); grid on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% xlabel('Stroke Speed[m/s]');
% ylabel('DampingForce[N]');
% hold off;

figure(4);
plot(F.Time(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', green, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-12,12]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
xticklabels({'0', '0.5', '1', '1.5', '2'});
ylabel('Damper Force [N/m]');
legend('F', 'FontName', 'Cambria Math');
hold off;