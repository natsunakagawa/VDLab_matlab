clear; 
close all;

load('sin_serial.mat');

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

Time = sin_serial.X.Data;
input = sin_serial.Y(1).Data;
x = sin_serial.Y(2).Data;
Fc = sin_serial.Y(3).Data;

% --グラフ化--
figure(1);
plot(Time(2501:4001), input(2501:4001), 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([5,8, -0.008,0.008]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('A [mm]');
hold off;

figure(2);
plot(Time(2501:4001), x(2501:4001), 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([5,8, -0.04,0.04]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('x [m]');
hold off;

figure(3);
plot(Time(2501:4001), Fc(2501:4001), 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([5,8, -0.02,0.02]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('F_c [N/m]');
hold off;