clear; 
close all;

load('hiratsuka_dampa.mat');

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

Time = hiratsuka_dampa.X.Data;
x = hiratsuka_dampa.Y(3).Data;
input = hiratsuka_dampa.Y(4).Data;
Fc = hiratsuka_dampa.Y(5).Data;

% --グラフ化--
figure(1);
plot(Time(2501:4001), x(2501:4001), 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([5,8, -0.05,0.05]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('A [m]');
hold off;

figure(2);
plot(Time(2501:4001), input(2501:4001), 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
axis([5,8, -0.015,0.015]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('F_c [N/m]');
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