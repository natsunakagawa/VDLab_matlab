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


% --実験データmatファイル読み込み --%
load('360_pink_random_c50.mat');
expX = pink_random_c50.Y(1).Data;
expF = pink_random_c50.Y(3).Data*1000;

figure(1);
plot(expX, expF, 'color', blue, 'LineWidth', 1.0);
axis([-4,4,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Stroke[mm]');
ylabel('DampingForce[N]');
hold off;
