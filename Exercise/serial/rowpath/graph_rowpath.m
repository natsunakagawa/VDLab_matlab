clear; 
close all;

load('rec1_361.mat'); % off
load('rec1_362.mat'); % 10Hz
load('rec1_363.mat'); % 30Hz
load('rec1_364.mat'); % 100Hz
load('rec1_365.mat'); % 300Hz

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

Time = rec1_361.X(1).Data;
x = rec1_361.Y(3).Data;
Fc_off = rec1_361.Y(5).Data;
Fc_10 = rec1_362.Y(5).Data;
Fc_30 = rec1_363.Y(5).Data;

% --グラフ化--
% figure(1);
% plot(Time(5000:5500), x(5000:5500), 'color', blue, 'LineWidth', 2.0); hold on;
% set(gca, 'FontName', 'Arial');
% set(gca, 'FontSize', 14);
% axis([5,8, -0.008,0.008]); grid on;
% xlabel('T [s]');
% xticklabels({'0', '1', '2'});
% ylabel('A [mm]');
% hold off;

figure(2);
plot(Time(5000:5500), Fc_off(5000:5500), 'color', blue, 'LineWidth', 2.0); hold on;
% plot(Time(5000:5500), Fc_10(5000:5500), 'color', red, 'LineWidth', 2.0); hold on;
% plot(Time(5000:5500), Fc_30(5000:5500), 'color', green, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
% axis([5,10, -25,5]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2', '3', '4', '5'});
ylabel('Fc [N/m]');
hold off;