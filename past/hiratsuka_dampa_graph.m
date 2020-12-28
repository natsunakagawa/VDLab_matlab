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

%　グラフ時間
First_Time = 0;
End_Time = 5;
Step_Time = 0.002;
Start_Time = First_Time/Step_Time + 1;
Finish_Time = End_Time/Step_Time + 1;

%　シミュレーション実行
open_system('modemodemodel.slx');
out = sim('modemodemodel.slx');
close_system('modemodemodel.slx');

% --実験データmatファイル読み込み --%
% load('360_pink_random_c50.mat');
% expX = pink_random_c50.X.Data;
% sizeF = size(F.Data);
% sizeF = sizeF(1,1);

% --グラフ化--
figure(1);
plot(X.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
axis([-4,4,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Stroke[mm]');
ylabel('DampingForce[N]');
hold off;

figure(2);
plot(V.Data(Start_Time:Finish_Time), F.Data(Start_Time:Finish_Time), 'color', blue, 'LineWidth', 1.0);
axis([-0.1,0.1,-10,10]); grid on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Stroke Speed[m/s]');
ylabel('DampingForce[N]');
hold off;