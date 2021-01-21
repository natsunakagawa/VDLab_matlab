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

load('0121_2_5.mat');

start_time = 13;
end_time = start_time+2;



        
Time = rec.X.Data;
r = rec.Y(8).Data;
x_raw = rec.Y(4).Data;
x_lowpass = rec.Y(3).Data;
u = rec.Y(10).Data;
F_lowpass = rec.Y(1).Data;
F_raw = rec.Y(2).Data;

        
fc = 10;
fs = 1/0.003;;
% pass_Hz = 10;
% x = lowpass(x_raw, pass_Hz, 1/fs);
[b,a] = butter(2, fc/(fs/2));
x = filter(b,a,x_raw);
r = filter(b,a,r);
        
height = 240;
width = 300;

% --グラフ化--
figure(1);
plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 16);
set(gcf, 'Position', [75, 200, 350, 280]);
axis([start_time,end_time, -10,10]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Laser [mm]');
legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
hold off;


figure(2);
plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
plot(Time(:), x_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 16);
set(gcf, 'Position', [475, 200, 350, 280]);
axis([start_time,end_time, -10,10]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Laser [mm]');
legend('raw', 'lowpass(20Hz)', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
hold off;

figure(3);
plot(Time(:), F_raw(:), 'color', blue, 'LineWidth', 2.0); hold on;
plot(Time(:), F_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 16);
set(gcf, 'Position', [875, 200, 350, 280]);
axis([start_time,end_time, -5,5]); grid on;
xlabel('T [s]');
% xticklabels({'0', '1', '2'});
ylabel('Damper force [N/m]');
legend('raw', 'lowpass(20Hz)', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
hold off;
