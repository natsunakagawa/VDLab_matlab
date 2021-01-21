clear; 
close all;

load('0113_5_3.mat');

% Data ------------------
% 3_3, 5_1, 5_2 が優秀

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

Time = rec.X.Data;
F_raw = rec.Y(1).Data;
F_lowpass = rec.Y(2).Data;
x_lowpass = rec.Y(3).Data;
x_raw = rec.Y(4).Data;
u = rec.Y(6).Data;
input = rec.Y(7).Data;
v = rec.Y(9).Data;
r = rec.Y(10).Data;


fc = 10;
fs = 500;
pass_Hz = 20;
% x = lowpass(x_raw, pass_Hz, 1/fs);
[b,a] = butter(1, fc/(fs/2));
x = filter(b,a,x_raw);
% Fc = filter(b,a,F_raw);

start_time = 5;
end_time = start_time+2;


% --グラフ化--
figure(1);
plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
axis([start_time, end_time, -15,15]); grid on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 12);
set(gcf, 'Position', [50, 200, 350, 300]);
xlabel('T [s]');
ylabel('x_2 - x_1 [mm]');
% xticklabels({'0', '0.5', '1', '1.5', '2'});
legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.65 0.85 0.3 0.1]);
hold off;

figure(2);
plot(Time(:), F_raw(:), 'color', blue, 'LineWidth', 2.0); hold on;
plot(Time(:), F_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 12);
set(gcf, 'Position', [450, 200, 350, 300]);
axis([start_time,end_time, -4,4]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Damper force [N/m]');
legend('raw', 'lowpass(20Hz)', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
hold off;

figure(3);
plot(Time(:), x_raw(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), x_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 12);
set(gcf, 'Position', [850, 200, 350, 300]);
axis([start_time,end_time, -15,15]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Laser [mm]');
legend('raw', 'lowpass(20Hz)', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
hold off;
