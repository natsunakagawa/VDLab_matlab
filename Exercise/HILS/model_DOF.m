clear;
close all;

% パラメータ
m1 = 1.5;%[kg]
m2 = 6.4;%[kg]
k1 = 2200; % [N/m]
k2 = 439; % [N/m]
c1 = 50; % [N/m]  下げれば値近づく
c2 = 37; % [N/m]
A = 0.002;
Hz = 2*5*pi;
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
Step_Time = 0.003;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

out = sim('sim_DOF.slx');

x = out.x;
r = out.r;
u = out.u;
ana_F = out.ana_F;
hard_F = out.hard_F;

% --グラフ化--
figure(1);
plot(x.Time(Start_Time:Finish_Time), x.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 3.0); hold on;
plot(r.Time(Start_Time:Finish_Time), r.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-10,10]); grid on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 22);
xlabel('T [s]');
ylabel('x_2 - x_1 [mm]');
xticklabels({'0', '0.5', '1', '1.5', '2'});
legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.65 0.85 0.3 0.1]);

figure(2);
plot(u.Time(:), u.Data(:), 'color', red, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-8,8]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
% 
figure(3);
plot(ana_F.Time(Start_Time:Finish_Time), ana_F.Data(Start_Time:Finish_Time), 'color', red, 'LineWidth', 2.0); hold on;
plot(hard_F.Time(Start_Time:Finish_Time), hard_F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 2.0); hold on;
axis([First_Time,End_Time,-0.5,0.5]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('T [s]');
ylabel('x [mm]');
legend('Hardware', 'Analyasis')
