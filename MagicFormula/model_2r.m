clear;
close all;

%　研修　二輪モデル用

g = 9.81; % [m/s^2]

%　パラメータ
m = 1200; %重量 [kg]
Iz = 1500; % [kg * m^2] 
v = 100; %車速 [kh/h]
V = v/3.6; % m/s
Kf = 50000;
Kr = 50000;
lf = 1.2; % m
lr = 1.4; % m

camber = 0;%キャンバ角 [deg]

% Magic Formula 係数
a0 = 1.30;
a1 = -0.0274;
a2 = 1.05;
a3 = 1.18;
a4 = 7.69;
a5 = 0.009;
a6 = -0.257;
a7 = 0.224;
a8 = 0.025;
a9 = 0.01; 
a10 = 0.015;
a11 = 0.0849;
a12 = -0.0103;
a13 = 0.0395;

%　シミュレーション
Analysis_Time = 30;
Step_Time = 0.001;

open_system('kensyu_2r_mf.slx');
sim('kensyu_2r_mf.slx');


%%%% Graph

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

% Time --------------------------------------------------------------------
TIME = (0:Step_Time:Analysis_Time)';

% X - Y -------------------------------------------------------------------
figure(1);
set(gcf,'Position',[10+340*0 800-300*1.2 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(X, Y, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('X [m]');
ylabel('Y [m]');
%  axis([-400 400 -400 400]);
% set(gca, 'XTick', 0:1:10);
% set(gca, 'YTick', -20:2:10);
grid on;

figure(2);
set(gcf,'Position',[10+340*1 800-300*1.2 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, beta, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('Slip Angle [deg]');
% axis([0 20 -0.2 0.2]);
% set(gca, 'XTick', 0:10:20);
% set(gca, 'YTick', -0.2:0.2:0.2);
grid on;

% Yaw Rate ----------------------------------------------------------------
figure(3);
set(gcf,'Position',[10+340*2 800-300*1.2 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, r, 'color', blue, 'LineWidth', 2.0); hold on;    
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('Yaw Rate [deg/s]');
% axis([0 3 0 8]);
% set(gca, 'XTick', 0:1:3);
% set(gca, 'YTick', 0:2:8);
grid on;

% Lateral Acceleration ----------------------------------------------------
figure(4);
set(gcf,'Position',[10+340*3 800-300*1.2 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, ddy, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('Lateral Acc. [G]');
% axis([0 100 0 1]);
% set(gca, 'XTick', 0:20:100);
% set(gca, 'YTick', 0:0.2:1);
grid on;

% Front Tire Slip Angle ------------------------------------------------------
figure(5);
set(gcf,'Position',[10+340*0 800-300*2.4 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, alpha_f, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('F Tire  Slip Angle [deg]');
% axis([0 10 0 50]);
% set(gca, 'XTick', 0:2:10);
% set(gca, 'YTick', 0:20:100);
grid on;

% Rear Tire Slip Angle ------------------------------------------------------
figure(6);
set(gcf,'Position',[10+340*1 800-300*2.4 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, alpha_r, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('R Tire Slip Angle [deg]');
% axis([0 10 0 50]);
% set(gca, 'XTick', 0:2:10);
% set(gca, 'YTick', 0:20:100);
grid on;

% Front Tire Lateral Force ---------------------------------------------------
figure(7);
set(gcf,'Position',[10+340*2 800-300*2.4 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, Fy_f/1000, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('F Lateral Force [kN]');
% axis([0 10 0 50]);
% set(gca, 'XTick', 0:2:10);
% set(gca, 'YTick', 0:20:100);
grid on;

% FR Tire Lateral Force ---------------------------------------------------
figure(8);
set(gcf,'Position',[10+340*3 800-300*2.4 640*0.5 480*0.5]);
subplot('Position',[0.12*2.4 0.12*2.2 0.85*0.75 0.78*0.75]);
plot(TIME, Fy_r/1000, 'color', blue, 'LineWidth', 2.0); hold on;
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 14);
xlabel('Time [sec]');
ylabel('R Lateral Force [kN]');
% axis([0 10 0 50]);
% set(gca, 'XTick', 0:2:10);
% set(gca, 'YTick', 0:20:100);
grid on;