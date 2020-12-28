clear;
close all;

% パラメータ
m1 = 1.5;%[kg]
m2 = 6.4;%[kg]
k1 = 2200; % [N/m]
k2 = 405; % [N/m]
c1 = 150; % [N/m]
c2 = 15; % [N/m]
A = 0.003;
Hz = 2*pi;

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

%　シミュレーション
First_Time = 6;
End_Time = 8;
Step_Time = 0.001;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

out = sim('sim_DOF.slx');

% a1 = out.a1;
% a2 = out.a2;
% x1 = out.x1;
% x2 = out.x2;
sus_1d = out.sus_1d;
sus_2d = out.sus_2d;
% f_c = out.f_c;

% --グラフ化--
figure(1);
plot(sus_1d.Time(Start_Time:Finish_Time), sus_1d.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(sus_2d.Time(Start_Time:Finish_Time), sus_2d.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-8,8]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis');

figure(2);
plot(sus_1d.Time(:), sus_1d.Data(:), 'color', red, 'LineWidth', 2.0); hold on;
plot(sus_2d.Time(:), sus_2d.Data(:), 'color', blue, 'LineWidth', 2.0); hold on;
% axis([First_Time,End_Time,-8,8]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis');