clear;
close all;

% パラメータ
m1 = 1.5;%[kg]
m2 = 6.4;%[kg]
k1 = 2200; % [N/m]
k2 = 405; % [N/m]
c1 = 150; % [N/m]
c2 = 7; % [N/m]
A = 0.001;
Hz = 2*pi;
diff_cutoff = 20;
T_diff = 1/(2*pi*diff_cutoff);
t_end = 30;


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
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

out = sim('sim_DOF.slx');

% a1 = out.a1;
% a2 = out.a2;
% x1 = out.x1;
% x2 = out.x2;
x = out.x;
r = out.r;
% f_c = out.f_c;
ana_F = out.ana_F;
hard_F = out.hard_F;

% --グラフ化--
figure(1);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-8,8]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis');

figure(2);
plot(x.Time(:), x.Data(:), 'color', red, 'LineWidth', 2.0); hold on;
plot(r.Time(:), r.Data(:), 'color', blue, 'LineWidth', 2.0); hold on;
% axis([First_Time,End_Time,-8,8]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis');

figure(3);
plot(ana_F.Time(Start_Time:Finish_Time), ana_F.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(hard_F.Time(Start_Time:Finish_Time), hard_F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-0.5,0.5]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis');
