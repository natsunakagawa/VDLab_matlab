clear; 
close all;

load('0113_3_3.mat');

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

% --グラフ化--
figure(1);
plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([6,8, -12,12]); grid on;
xlabel('T [s]');
% xticklabels({'0', '0.5', '1', '1.5', '2'});
ylabel('x [mm]');
legend('-x''_1', 'x_2 - x_1', 'FontName', 'Cambria Math');
hold off;

figure(2);
plot(Time(:), F_raw(:), 'color', blue, 'LineWidth', 2.0); hold on;
plot(Time(:), F_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([6,8, -2,2]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Damper force [N/m]');
legend('raw', 'lowpass', 'FontName', 'Cambria Math');
hold off;

figure(3);
plot(Time(:), x_raw(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), x_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([6,8, -12,12]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Laser [mm]');
legend('raw', 'lowpass', 'FontName', 'Cambria Math');
hold off;
