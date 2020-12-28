% =============================================
% ダンパに関するグラフまとめて出す
% =============================================
%clear;
% Figureのクリア
clf;

%load('reaza.mat');

%%%開始時間と終了時間
targetinitial1=2;
targetend1=7;%12-14.1

targetinitial2=2;
targetend2=7;

targetinitial3=2;
targetend3=7;%2-3

samplingtime=0.002;

% プロットされる配列を用意
%time1 = reaza.X.Data;
ini1=(targetinitial1+samplingtime)/samplingtime;
las1=(targetend1+samplingtime)/samplingtime;
%%%%
ini2=(targetinitial2+samplingtime)/samplingtime;
las2=(targetend2+samplingtime)/samplingtime;
%%%%%
ini3=(targetinitial3+samplingtime)/samplingtime;
las3=(targetend3+samplingtime)/samplingtime;
%%%%
windowSize=16;
b = (1/windowSize)*ones(1,windowSize);
a = 1;

windowSize1 =16;
b1 = (1/windowSize1)*ones(1,windowSize1);

windowSize2 =16;
b2 = (1/windowSize2)*ones(1,windowSize2);
okure=10;

% fc=20;
% fs=500;
% [b,a]=butter(1,fc/(fs/2),'low');
%y = filter(b,a,x);

%%
%%
load('262_pink_1_1_0.mat');
load('263_pink_1_2_0.mat');
load('264_pink_1_3_0.mat');
load('265_pink_1_4_0.mat');
load('266_pink_1_5_0.mat');
% 
% 
% 
% load('264_pink_1_3_0.mat');
% load('269_pink_2_3_0.mat');
% load('274_pink_3_3_0.mat');
% 
% load('274_pink_3_3_0.mat');
% load('294_pink_3_3_-20.mat');
% load('296_pink_3_3_20.mat');
% 
% load('308_green_1_3_0.mat');
% load('314_green_2_3_0.mat');
% load('319_green_3_3_0.mat');
% 
load('307_green_1_2_0.mat');
load('313_green_2_2_0.mat');
load('318_green_3_2_0.mat');
% 
% load('306_green_1_1_0.mat');
% load('312_green_2_1_0.mat');
% load('317_green_3_1_0.mat');
% 
% load('262_pink_1_1_0.mat');
% load('267_pink_2_1_0.mat');
% load('272_pink_3_1_0.mat');
% 
% 
% load('312_green_2_1_0.mat');
% load('313_green_2_2_0.mat');
% load('314_green_2_3_0.mat');
% load('315_green_2_4_0.mat');
% load('316_green_2_5_0.mat');
% 
% load('317_green_3_1_0.mat');
% load('332_green_3_1_20.mat');
% load('340_green_3_1_-20.mat');
% 
% load('271_pink_2_5_0.mat');
% load('292_pink_2_5_-20.mat');
% load('289_pink_2_5_20.mat');
% 
load('289_pink_2_5_20.mat')
load('292_pink_2_5_-20.mat')
load('271_pink_2_5_0.mat')
% 
load('263_pink_1_2_0.mat');
load('268_pink_2_2_0.mat');
load('273_pink_3_2_0.mat');
% 
 load('274_pink_3_3_0.mat');
 load('275_pink_3_4_0.mat');
 load('276_pink_3_5_0.mat');

load('319_green_3_3_0.mat');
load('320_green_3_4_0.mat');
load('321_green_3_5_0.mat');

load('272_pink_3_1_0.mat');
load('273_pink_3_2_0.mat');
load('267_pink_2_1_0.mat');

load('316_green_2_5_0.mat');
load('331_green_2_5_20.mat');
load('339_green_2_5_-20.mat');
load('269_pink_2_3_0.mat');
load('270_pink_2_4_0.mat');

load('269_pink_2_3_0.mat');
load('288_pink_2_3_20.mat');
load('291_pink_2_3_-20.mat');

load('274_pink_3_3_0.mat');
load('296_pink_3_3_20.mat');

load('294_pink_3_3_-20.mat');

name1=pink_3_3_0;
name2=pink_1_3_0;
name3=pink_3_3_20;
name4=pink_1_4_0;
name5=pink_3_3__20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1111111111111
% load('295_pink_3_1_20.mat');
% % stroke1 = filter(b,a,rec.Y(3).Data(ini:las));
%  %a,rec.Y(5).Data);
%  name1=pink_3_1_20;

 time1= name1.X.Data(ini1:las1);
stroke1 = lowpass(name1.Y(5).Data,20,500);
%stroke1 = lowpass(rec.Y(3).Data,20,500);
velocity1=diff(stroke1)/0.002;
%velocity1=lowpass(velocity1,20,500);
velocity1=filter(b,a,velocity1);

stroke1 = stroke1(ini1+okure:las1+okure);
velocity1=velocity1(ini1+okure:las1+okure);
%force1 = rec.Y(5).Data;
force1 = lowpass(name1.Y(7).Data,20,500);
%force1=filter(b,a,force1);

%load('model_pink_3_3.mat');

%load('model_pink_2_5_20.mat')
%load('model_1_2_pink.mat');

 %load('model_green_2_5_20.mat');
% 
% load('model_green_3_3.mat');

%load('model_green_1_2.mat');



force1 = -force1(ini1:las1);
%force1=force;

%data2 = X4.Y(2).Data;
%data3 = X4.Y(3).Data;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2222222222222222
% load('272_pink_3_1_0.mat');
% name2=pink_3_1_0;

% stroke2 =filter(b,a,rec.Y(3).Data(ini:las));
 %force2 =filter(b,a,rec.Y(5).Data);
time2= name2.X.Data(ini2:las2);
stroke2 = lowpass(name2.Y(5).Data,20,500);

%stroke2 = lowpass(rec.Y(3).Data,20,500);
velocity2=diff(stroke2)/0.002;
%velocity2=lowpass(velocity2,20,500);
velocity2=filter(b,a,velocity2);

stroke2 = stroke2(ini2+okure:las2+okure);

velocity2=velocity2(ini2+okure:las2+okure);
%force2 = rec.Y(5).Data,20,500;
force2 = lowpass(name2.Y(7).Data,20,500);
force2=filter(b,a,force2);
force2 = -force2(ini2:las2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3333333333333
% load('293_pink_3_1_-20.mat')
% name3=pink_3_1__20;

% stroke3 = filter(b,a,rec.Y(3).Data(ini:las));
 %force3 = filter(b,a,rec.Y(5).Data);
time3= name3.X.Data(ini3:las3);
stroke3 = lowpass(name3.Y(5).Data,20,500);
%stroke3 = rec.Y(3).Data;
%stroke3 = lowpass(rec.Y(3).Data,20,500);
velocity3=diff(stroke3)/0.002;
%velocity3=lowpass(velocity3,20,500);
velocity3=filter(b1,a,velocity3);

stroke3 = stroke3(ini3+okure:las3+okure);
velocity3=velocity3(ini3+okure:las3+okure);
%force3 = rec.Y(5).Data,20,500;
force3 = lowpass(name3.Y(7).Data,20,500);
%force3=filter(b1,a,force3);

%load('model_pink_3_4.mat');
%load('model_pink_2_5_0.mat')
force3 = -force3(ini3:las3);

%load('model_pink_2_2.mat');
 %load('model_green_2_5_0.mat');
% 
% 
%load('model_green_3_4.mat');

%load('model_green_2_2.mat');

%force3=force;

%load('5_1_0005.mat');
%time11 = rec.Y(1).Data(3000:3400);
%data111 = rec.Y(3).Data(3000:3400);

% load('X3.mat');
% 
% % プロットされる配列を用意
% %time1 = reaza.X.Data;
% time = X3.X.Data;
% data1 = 0.01.*X3.Y(1).Data;
% %data2 = X3.Y(2).Data;
% data3 = X3.Y(3).Data;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%44444444444444444444
% load('272_pink_3_1_0.mat');
% name4=pink_3_1_0;

% stroke2 =filter(b,a,rec.Y(3).Data(ini:las));
 %force2 =filter(b,a,rec.Y(5).Data);
time4= name4.X.Data(ini2:las2);
stroke4 = lowpass(name4.Y(5).Data,20,500);

%stroke2 = lowpass(rec.Y(3).Data,20,500);
velocity4=diff(stroke4)/0.002;
%velocity2=lowpass(velocity2,20,500);
velocity4=filter(b,a,velocity4);

stroke4 = stroke4(ini2+okure:las2+okure);

velocity4=velocity4(ini2+okure:las2+okure);
%force2 = rec.Y(5).Data,20,500;
force4 = lowpass(name4.Y(7).Data,20,500);
force4=filter(b,a,force4);
force4 = -force4(ini2:las2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555555555555555555
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('272_pink_3_1_0.mat');
% name5=pink_3_1_0;

% stroke2 =filter(b,a,rec.Y(3).Data(ini:las));
 %force2 =filter(b,a,rec.Y(5).Data);
time5= name5.X.Data(ini2:las2);
stroke5 = lowpass(name5.Y(5).Data,20,500);

%stroke2 = lowpass(rec.Y(3).Data,20,500);
velocity5=diff(stroke5)/0.002;
%velocity2=lowpass(velocity2,20,500);
velocity5=filter(b2,a,velocity5);

stroke5 = stroke5(ini2+okure:las2+okure);

velocity5=velocity5(ini2+okure:las2+okure);
%force2 = rec.Y(5).Data,20,500;
force5 = lowpass(name5.Y(7).Data,20,500);
%force5=filter(b2,a,force5);

%load('model_pink_3_5.mat');

%load('model_pink_2_5_-20.mat');
%load('model_pink_3_2.mat');
 %load('model_green_2_5_-20.mat');
% 
%load('model_green_3_5.mat');

%load('model_green_3_2.mat');
%force5=force;
force5 = -force5(ini2:las2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%66666666666666
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % load('272_pink_3_1_0.mat');
% % % name6=pink_3_1_0;
% % 
% % % stroke2 =filter(b,a,rec.Y(3).Data(ini:las));
% %  %force2 =filter(b,a,rec.Y(5).Data);
% % time6= name6.X.Data(ini2:las2);
% % stroke6 = lowpass(name6.Y(5).Data,20,500);
% % 
% % %stroke2 = lowpass(rec.Y(3).Data,20,500);
% % velocity6=diff(stroke6)/0.002;
% % %velocity2=lowpass(velocity2,20,500);
% % velocity6=filter(b,a,velocity6);
% % 
% % stroke6 = stroke6(ini2+okure:las2+okure);
% % 
% % velocity6=velocity6(ini2+okure:las2+okure);
% % %force2 = rec.Y(5).Data,20,500;
% % force6 = lowpass(name6.Y(7).Data,20,500);
% % force6=filter(b,a,force6);
% % force6 = -force6(ini2:las2);
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%77777777777777777
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % load('272_pink_3_1_0.mat');
% % % name7=pink_3_1_0;
% % 
% % % stroke2 =filter(b,a,rec.Y(3).Data(ini:las));
% %  %force2 =filter(b,a,rec.Y(5).Data);
% % time7= name7.X.Data(ini2:las2);
% % stroke7 = lowpass(name7.Y(5).Data,20,500);
% % 
% % %stroke2 = lowpass(rec.Y(3).Data,20,500);
% % velocity7=diff(stroke7)/0.002;
% % %velocity2=lowpass(velocity2,20,500);
% % velocity7=filter(b,a,velocity7);
% % 
% % stroke7 = stroke7(ini2+okure:las2+okure);
% % 
% % velocity7=velocity7(ini2+okure:las2+okure);
% % %force2 = rec.Y(5).Data,20,500;
% % force7 = lowpass(name7.Y(7).Data,20,500);
% % force7=filter(b,a,force7);
% % force7 = -force7(ini2:las2);


%%

kensyo1=rms(force1);
kensyo2=rms(force2);
kensyo3=rms(force3);


Xrange=0.004;
Vrange=0.1;
Frange=15;

legend1='25mm';
legend2='45mm';
legend3='65mm';
% legend4='4Hz';
% legend5='5hz';


% color1='r-';
% color2='g-';
% color3='b-';
% color4='c-';
% color5='m-';
% color6='y-';
% color7='k-';
color1='r-';
color2='g-';
color3='g-';
color4='c-';
color5='b-';
color6='y-';
color7='k-';

n=1;nn=2;nnn=5;
%%グラフゾーン
%%


%%
%%
figure(1);%%%%FX
% 値のプロット

% x_law=lowpass(stroke1-0.01,20,500);%(data,ｶｯﾄｵﾌ？？,サンプリング周波数）
% y_law=lowpass(force1,20,500);
% 
% 
% x_law1=lowpass(stroke2,20,500);%(data,ｶｯﾄｵﾌ？？,サンプリング周波数）
% y_law1=lowpass(force2,20,500);
% 
% x_law2=lowpass(stroke3+0.006,20,500);%(data,ｶｯﾄｵﾌ？？,サンプリング周波数）
% y_law2=lowpass(force3,20,500);

%plot(rec1_16000.X.Data(6000:6500),time);hold on;

% plot(stroke1,force1,color1,'LineWidth',2.0); hold off;
% plot(stroke2,force2,color2,'LineWidth',2.0); hold off;
% plot(stroke3,force3,color3,'LineWidth',2.0); hold off;




for i=n:nn:nnn
    s=num2str(i);
    
    stroke=eval(strcat('stroke',s));
    force=eval(strcat('force',s));
    color=eval(strcat('color',s));
    
    plot(stroke(1500:2000),force(1500:2000),color,'LineWidth',1.5); hold on;


end
% plot(stroke4,force4,color4,'LineWidth',2.0); hold on;
% plot(stroke5,force5,color5,'LineWidth',2.0); hold on;
% plot(stroke6,force6,color6,'LineWidth',2.0); hold on;
% plot(stroke7,force7,color7,'LineWidth',2.0); hold on;

% plot(stroke3,force3,color3,'LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;

% グラフ上のテキストのフォントを指定
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

% タイトルなどを描画
title('');
xlabel('Stroke[m]');
ylabel('DampingForce[N]');

% テキストサイズを変更
set(gca,'FontSize',26);

% グラフの軸範囲と軸刻みを指定
axis([-Xrange Xrange -Frange Frange]);
%set(gca,'XTick',[19.35:0.01:19.45]);
%set(gca,'YTick',[16000:2000:34000]);

% グリッドを表示
grid on;

% 凡例を表示
%legend('Laser','Enc','Model');

legend(legend1,legend2,legend3);


%x_law=lowpass(time1,20,500);(data,ｶｯﾄｵﾌ？？,サンプリング周波数）
%y_law=lowpass(data11,20,500);
%plot(x_law,y_law)

%%
figure(2);%%%%% velocity
%plot(rec1_16000.X.Data(6000:6500),time);hold on;
for i=n:nn:nnn
    s=num2str(i);
    
    time=eval(strcat('time',s));
    velocity=eval(strcat('velocity',s));
    color=eval(strcat('color',s));
    
    plot(time,velocity,color,'LineWidth',1.5); hold on;


end
% plot(time1,velocity1,color1,'LineWidth',2.0); hold on;
% plot(time2,velocity2,color2,'LineWidth',2.0); hold on;
% plot(time3,velocity3,color3,'LineWidth',2.0); hold on;
% plot(time4,velocity4,color4,'LineWidth',2.0); hold on;
% plot(time5,velocity5,color5,'LineWidth',2.0); hold on;
% plot(time6,velocity6,color6,'LineWidth',2.0); hold on;
% plot(time7,velocity7,color7,'LineWidth',2.0); hold on;



%plot(time11,data111,'b-','LineWidth',2.0); hold off;

% グラフ上のテキストのフォントを指定
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

% タイトルなどを描画
title('');
xlabel('Time[s]');
ylabel('Stroke Speed[m/s]');

% テキストサイズを変更
set(gca,'FontSize',26);

% グラフの軸範囲と軸刻みを指定

%axis([0 0.5 -0.07 0.07]);
axis([ini1*0.002-0.002 las1*0.002-0.002 -Vrange Vrange]);

xticklabels({'0','1','2'});
set(gca,'XTick',[2:1:3]);
%set(gca,'YTick',[-0.08:0.02:0.08]);

% グリッドを表示
grid on;
legend(legend1,legend2,legend3);
% 凡例を表示
%legend('Laser','Enc','Model');
%legend('10mm','0mm','-10mm');
%%
figure(3); %%%Force
%plot(rec1_16000.X.Data(6000:6500),time);hold on;

for i=n:nn:nnn
    s=num2str(i);
    
    time=eval(strcat('time',s));
    force=eval(strcat('force',s));
    color=eval(strcat('color',s));
    
    plot(time,force,color,'LineWidth',1.5); hold on;


end
% plot(time1,force1,color1,'LineWidth',2.0); hold on;
% plot(time2,force2,color2,'LineWidth',2.0); hold on;
% plot(time3,force3,color3,'LineWidth',2.0); hold on;
% plot(time4,force4,color4,'LineWidth',2.0); hold on;
% plot(time5,force5,color5,'LineWidth',2.0); hold on;
% plot(time6,force6,color6,'LineWidth',2.0); hold on;
% plot(time7,force7,color7,'LineWidth',2.0); hold on;


%plot(time11,data111,'b-','LineWidth',2.0); hold off;

% グラフ上のテキストのフォントを指定
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

% タイトルなどを描画
title('');
xlabel('Time[s]');
ylabel('DampingForce[N]');

% テキストサイズを変更
set(gca,'FontSize',26);

% グラフの軸範囲と軸刻みを指定
axis([ini1*0.002-0.002 las1*0.002-0.002 -Frange Frange]);
xticklabels({'0','1','2'});
set(gca,'XTick',[2:1:3]);
%set(gca,'YTick',[16000:2000:34000]);

% グリッドを表示
grid on;
legend(legend1,legend2,legend3);
% 凡例を表示
%legend('Laser','Enc','Model');
%legend('6mm 1Hz','4mm 1.5Hz','2mm 3Hz');
%%
figure(4);%FV
%plot(rec1_16000.X.Data(6000:6500),time);hold on;
for i=n:nn:nnn
    s=num2str(i);
    
    velocity=eval(strcat('velocity',s));
    force=eval(strcat('force',s));
    color=eval(strcat('color',s));
    
    plot(velocity(1500:2000),force(1500:2000),color,'LineWidth',1.5); hold on;


end

% plot(velocity1,force1,color1,'LineWidth',2.0); hold on;
% plot(velocity2,force2,color2,'LineWidth',2.0); hold on;
% plot(velocity3,force3,color3,'LineWidth',2.0); hold on;
% plot(velocity4,force4,color4,'LineWidth',2.0); hold on;
% plot(velocity5,force5,color5,'LineWidth',2.0); hold on;
% plot(velocity6,force6,color6,'LineWidth',2.0); hold on;
% plot(velocity7,force7,color7,'LineWidth',2.0); hold on;

%plot(time11,data111,'b-','LineWidth',2.0); hold off;

% グラフ上のテキストのフォントを指定
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

% タイトルなどを描画
title('');
xlabel('Stroke Speed[m/s]');
ylabel('DampingForce[N]');

% テキストサイズを変更
set(gca,'FontSize',26);

% グラフの軸範囲と軸刻みを指定
axis([-Vrange Vrange -Frange Frange]);
%set(gca,'XTick',[19.35:0.01:19.45]);
%set(gca,'YTick',[16000:2000:34000]);

% グリッドを表示
grid on;

% 凡例を表示
%legend('Laser','Enc','Model');
legend(legend1,legend2,legend3);
%legend('6mm 1Hz','4mm 1.5Hz','2mm 3Hz');
%%
figure(5);%%%Stroke


for i=n:nn:nnn
    s=num2str(i);
    
    time=eval(strcat('time',s));
    stroke=eval(strcat('stroke',s));
    color=eval(strcat('color',s));
    
    plot(time,stroke,color,'LineWidth',1.5); hold on;


end

%plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(time1,stroke1,color1,'LineWidth',2.0); hold on;
% plot(time2,stroke2,color2,'LineWidth',2.0); hold on;
% plot(time3,stroke3,color3,'LineWidth',2.0); hold on;
%plot(time11,data111,'b-','LineWidth',2.0); hold off;

% グラフ上のテキストのフォントを指定
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

% タイトルなどを描画
title('');
xlabel('Time[s]');
ylabel('Stroke[m]');

% テキストサイズを変更
set(gca,'FontSize',26);

% グラフの軸範囲と軸刻みを指定
axis([ini1*0.002-0.002 las1*0.002-0.002 -Xrange Xrange]);
xticklabels({'0','1','2'});
set(gca,'XTick',[2:1:3]);
%set(gca,'YTick',[-0.004:0.002:0.004]);

% グリッドを表示
grid on;

% 凡例を表示
%legend('Laser','Enc','Model');
%legend('10mm','0mm','-10mm');

legend(legend1,legend2,legend3);

%x_law=lowpass(time1,20,500);(data,ｶｯﾄｵﾌ？？,サンプリング周波数）
%y_law=lowpass(data11,20,500);
%plot(x_law,y_law)
% %% Volume
% %% current Volume/max Volume
% D=0.0325;%%m
% S=pi*D^2/4;
% %X=76.2+35.05-22.73-8.26-1.27-1.52e-3;
% Xs=(22.6+5.2)*0.001;
% V1=(0.035-stroke1)/(0.035)*100;
% V2=(0.042-stroke2)/0.042*100;
% V3=(0.055-stroke3)/(0.055)*100;
% 
% figure(6);%%%Stroke
% %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(time1,V1,'r-','LineWidth',2.0); hold on;
% plot(time2,V2,'g-','LineWidth',2.0); hold on;
% plot(time3,V3,'b-','LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% 
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% 
% % タイトルなどを描画
% title('');
% xlabel('Time[s]');
% ylabel('Volume ratio[%]');
% 
% % テキストサイズを変更
% set(gca,'FontSize',26);
% 
% % グラフの軸範囲と軸刻みを指定
% axis([ini1*0.002-0.002 las1*0.002-0.002-0.1 90 110]);
% %set(gca,'XTick',[19.35:0.01:19.45]);
% %set(gca,'YTick',[16000:2000:34000]);
% 
% % グリッドを表示
% grid on;
% 
% % 凡例を表示
% %legend('Laser','Enc','Model');
% legend('35 mm','45 mm','55 mm');
% % %% Volume change ratio
% % D=0.0093;%%m
% % S=pi*D^2/4;
% % X=52.07e-3;
% % Xs=(22.6+5.2)*0.001;
% % Vr1=(-stroke1)/(Xs-0.0082)*100;
% % Vr2=(-stroke2)/Xs*100;
% % Vr3=(-stroke3)/(Xs+0.0082)*100;
% % 
% % figure(7);%%%Stroke
% % %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% % plot(time1,Vr1,'r-','LineWidth',2.0); hold on;
% % plot(time2,Vr2,'g-','LineWidth',2.0); hold on;
% % plot(time3,Vr3,'b-','LineWidth',2.0); hold off;
% % %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% % 
% % % グラフ上のテキストのフォントを指定
% % set(gca,'FontName','Arial');
% % set(gca,'FontSize',12);
% % 
% % % タイトルなどを描画
% % title('');
% % xlabel('Time[s]');
% % ylabel('Change ratio[%]');
% % 
% % % テキストサイズを変更
% % set(gca,'FontSize',26);
% % 
% % % グラフの軸範囲と軸刻みを指定
% % axis([ini1*0.002-0.002 las1*0.002-0.002-0.1 -30 30]);
% % %set(gca,'XTick',[19.35:0.01:19.45]);
% % %set(gca,'YTick',[16000:2000:34000]);
% % 
% % % グリッドを表示
% % grid on;
% % 
% % % 凡例を表示
% % %legend('Laser','Enc','Model');
% % legend('35 mm','45 mm','55 mm');
% %%
% figure(7);%%%%model Force
% S=(32.50*0.001)^2*pi/4;
% omega=2*pi*2;
% P0=101325;
% ha=55*0.001;%%
% Aor=3*0.0352*0.000001*2;%%
% Cor=0.9;%%流量係数
% kappa=1.4;
% rho=1.1841;
% b1=1.113;
% Y0=0.003;%%
% N0=omega*S*ha*sqrt(rho/(2*P0))/(kappa*Cor*Aor);
% Pa=(1/2)*(sqrt( (b1/N0)^4 +(2*kappa*Y0)^2 )-(b1/N0)^2);
% 
% N=N0*sqrt(Pa)/b1;
% 
% kkk=(kappa*P0*S*1)*N^2/(ha*(N^2+1));
% ccc=kappa*P0*S*N/(omega*ha*(N^2+1));
% 
% % P1=P.*(0.035.^1.4)./(0.035-stroke1).^1.4;
% % P2=P.*(0.042.^1.4)./(0.042-stroke2).^1.4;
% % P3=P.*(0.055.^1.4)./(0.055-stroke3).^1.4;
% % V11=stroke1/0.035;
% % V22=stroke2/0.042;
% % V33=stroke3/0.055;
% % rho=1.1841;
% 
% % 
% % c=0.0001;
% % k=50;
% % Fm1=0;
% % Fm2=0;
% % Fm3=0;
% 
% force11=-kkk.*stroke1-ccc.*velocity1.^2.*sign(velocity1);
% force22=-kkk.*stroke2-ccc.*velocity2.^2.*sign(velocity2);
% force33=-kkk.*stroke3-ccc.*velocity3.^2.*sign(velocity3);
% 
% 
% % force11=c.*sign(P1-P).*(sqrt(2*abs(P1-P)./rho)).^2;
% % force22=c.*sign(P2-P).*(sqrt(2*abs(P2-P)./rho)).^2;
% % force33=c.*sign(P3-P).*(sqrt(2*abs(P3-P)./rho)).^2;
% %  force11=c.*velocity1.*velocity1.*sign(velocity1)+k.*V11/10;
% %  force22=c.*velocity2.*velocity2.*sign(velocity2)+k.*V22/10;
% %  force33=c.*velocity3.*velocity3.*sign(velocity3)+k.*V33/10;
% % 値のプロット
% %%%Force
% %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(time1,force11,'r-','LineWidth',2.0); hold on;
% plot(time2,force22,'g-','LineWidth',2.0); hold on;
% plot(time3,force33,'b-','LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% 
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% 
% % タイトルなどを描画
% title('');
% xlabel('Time[s]');
% ylabel('DampingForce[N]');
% 
% % テキストサイズを変更
% set(gca,'FontSize',26);
% 
% % グラフの軸範囲と軸刻みを指定
% axis([ini1*0.002-0.002 las1*0.002-0.002 -2 2]);
% %set(gca,'XTick',[19.35:0.01:19.45]);
% %set(gca,'YTick',[16000:2000:34000]);
% 
% % グリッドを表示
% grid on;
% 
% % 凡例を表示
% %legend('Laser','Enc','Model');
% legend('35 mm','45 mm','5555 mm');
% %%
% figure(8);%%%%model FX
% S=(32.50*0.001)^2*pi/4;
% % Sor=(6.70761671*0.001)^2*pi/4;
% P=101325;
% c=1000;
% 
% % c1=0.00005;
% kp=1.4;
% % q1=c1.*sign(P1-P).*Sor.*(sqrt(2*abs(P1-P).*rho));
% % q2=c1.*sign(P2-P).*Sor.*(sqrt(2*abs(P2-P).*rho));
% % q3=c1.*sign(P3-P).*Sor.*(sqrt(2*abs(P3-P).*rho));
% % h=0.03;
% % 
% % r=0.004;
% % myu=1.8*10^(-5);
% %Qall=(pi*h^3*PP)/(6*myu*log(r));
% 
% 
% P1=P.*(0.042^kp)./((0.042-stroke1).^kp);
% P2=P.*(0.042^kp)./((0.042-stroke2).^kp);
% P3=P.*(0.042^kp)./((0.042-stroke3).^kp);
% 
% % P1=P.*(0.035./(0.035-stroke1)).^kp;
% % P2=P.*(0.042./(0.042-stroke2)).^kp;
% % P3=P.*(0.055./(0.055-stroke3)).^kp;
% 
% % P1=P.*((rho*0.035*S-q1)./rho.*(0.035-stroke1)).^1.4;
% % P2=P.*((rho*0.042*S-q2)./rho.*(0.042-stroke2)).^1.4;
% % P3=P.*((rho*0.055*S-q3)./rho.*(0.055-stroke3)).^1.4;
% 
% % P1=P.*((rho*0.035*S)./(rho.*(0.035-stroke1)));
% % P2=P.*((rho*0.042*S)./(rho.*(0.042-stroke2)));
% % P3=P.*((rho*0.055*S)./(rho.*(0.055-stroke3)));
% 
% f1=(P1-P)*S;
% f2=(P2-P)*S;
% f3=(P3-P)*S;
% % 
% % V11=stroke1/0.035;
% % V22=stroke2/0.042;
% % V33=stroke3/0.055;
% % rho=1.1841;%25℃
% % 
% % k=0.1;
% % Fm1=0;
% % Fm2=0;
% % Fm3=0;
% 
% % force11=-f1.*k;
% % force22=-f2.*k;
% % force33=-f3.*k;
% 
% %  force11=-(c.*abs(velocity1).^2.*sign(velocity1));
% %  force22=-(c.*velocity2.^2.*sign(velocity2));
% %  force33=-(c.*velocity3.^2.*sign(velocity3));
% k=0.1;
% 
% % force11=(-(c.*velocity1+f1.*k));
% % force22=(-(c.*velocity2+f2.*k));
% % force33=(-(c.*velocity3+f3.*k));
% 
% force11=(-(c.*velocity1.*velocity1.*sign(velocity1)+f1.*k));
% force22=(-(c.*velocity2.*velocity2.*sign(velocity2)+f2.*k));
% force33=(-(c.*velocity3.*velocity3.*sign(velocity3)+f3.*k));
% 
% % force11=c.*velocity1.*velocity1.*sign(velocity1)+k.*V11/10;
% % force22=c.*velocity2.*velocity2.*sign(velocity2)+k.*V22/10;
% % force33=c.*velocity3.*velocity3.*sign(velocity3)+k.*V33/10;
% 
% % force11=c.*sign(P1-P).*(sqrt(2*abs(P1-P)./rho)).^2;
% % force22=c.*sign(P2-P).*(sqrt(2*abs(P2-P)./rho)).^2;
% % force33=c.*sign(P3-P).*(sqrt(2*abs(P3-P)./rho)).^2;
% 
% % 値のプロット
% %%%Force
% %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(stroke1,force11,'r-','LineWidth',2.0); hold on;
% plot(stroke2,force22,'g-','LineWidth',2.0); hold on;
% plot(stroke3,force33,'b-','LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% 
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% 
% % タイトルなどを描画
% title('');
% xlabel('Stroke[m]');
% ylabel('DampingForce[N]');
% 
% % テキストサイズを変更
% set(gca,'FontSize',26);
% 
% % グラフの軸範囲と軸刻みを指定
% axis([-Xrange Xrange -Frange Frange]);
% %set(gca,'XTick',[19.35:0.01:19.45]);
% %set(gca,'YTick',[16000:2000:34000]);
% 
% % グリッドを表示
% grid on;
% 
% % 凡例を表示
% %legend('Laser','Enc','Model');
% legend('35 mm','45 mm','55 mm');
% %%
% figure(9);%%%%model FV
% % S=(32.50*0.001)^2*pi/4;
% % Sor=(6.70761671*0.001)^2*pi/4;
% % P=101325;
% % c=260;
% % c1=0.00005;
% 
% % q1=c1.*sign(P1-P).*Sor.*(sqrt(2*abs(P1-P).*rho));
% % q2=c1.*sign(P2-P).*Sor.*(sqrt(2*abs(P2-P).*rho));
% % q3=c1.*sign(P3-P).*Sor.*(sqrt(2*abs(P3-P).*rho));
% 
% % P1=P*(0.035^1.4)./(0.035-stroke1).^1.4;
% % P2=P*(0.042^1.4)./(0.042-stroke2).^1.4;
% % P3=P*(0.055^1.4)./(0.055-stroke3).^1.4;
% 
% % P1=P.*((rho*0.035*S-q1)./rho.*(0.035-stroke1)).^1.4;
% % P2=P.*((rho*0.042*S-q2)./rho.*(0.042-stroke2)).^1.4;
% % P3=P.*((rho*0.055*S-q3)./rho.*(0.055-stroke3)).^1.4;
% 
% % P1=P.*((rho*0.035*S)./(rho.*(0.035-stroke1)));
% % P2=P.*((rho*0.042*S)./(rho.*(0.042-stroke2)));
% % P3=P.*((rho*0.055*S)./(rho.*(0.055-stroke3)));
% 
% 
% 
% % V11=stroke1/0.035;
% % V22=stroke2/0.042;
% % V33=stroke3/0.055;
% % rho=1.1841;%25℃
% % 
% % k=120;
% % Fm1=0;
% % Fm2=0;
% % Fm3=0;
% % force11=c.*velocity1.*velocity1.*sign(velocity1)+k.*V11/10;
% % force22=c.*velocity2.*velocity2.*sign(velocity2)+k.*V22/10;
% % force33=c.*velocity3.*velocity3.*sign(velocity3)+k.*V33/10;
% 
% % force11=c.*sign(P1-P).*(sqrt(2*abs(P1-P)./rho)).^2;
% % force22=c.*sign(P2-P).*(sqrt(2*abs(P2-P)./rho)).^2;
% % force33=c.*sign(P3-P).*(sqrt(2*abs(P3-P)./rho)).^2;
% 
% % 値のプロット
% %%%Force
% %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(velocity1,force11,'r-','LineWidth',2.0); hold on;
% plot(velocity2,force22,'g-','LineWidth',2.0); hold on;
% plot(velocity3,force33,'b-','LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% 
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% 
% % タイトルなどを描画
% title('');
% xlabel('Stroke Speed[m/s]');
% ylabel('DampingForce[N]');
% 
% % テキストサイズを変更
% set(gca,'FontSize',26);
% 
% % グラフの軸範囲と軸刻みを指定
% axis([-Vrange Vrange -Frange Frange]);
% %set(gca,'XTick',[19.35:0.01:19.45]);
% %set(gca,'YTick',[16000:2000:34000]);
% 
% % グリッドを表示
% grid on;
% 
% % 凡例を表示
% %legend('Laser','Enc','Model');
% legend('35 mm','45 mm','55 mm');
% %%*
% %%
% figure(10);%%%%model Force
% 
% %plot(rec1_16000.X.Data(6000:6500),time);hold on;
% plot(time1,force11,'r-','LineWidth',2.0); hold on;
% plot(time2,force22,'g-','LineWidth',2.0); hold on;
% plot(time3,force33,'b-','LineWidth',2.0); hold off;
% %plot(time11,data111,'b-','LineWidth',2.0); hold off;
% 
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% 
% % タイトルなどを描画
% title('');
% xlabel('Time[s]');
% ylabel('DampingForce[N]');
% 
% % テキストサイズを変更
% set(gca,'FontSize',26);
% 
% % グラフの軸範囲と軸刻みを指定
% axis([ini1*0.002-0.002 las1*0.002-0.002 -Frange Frange]);
% %set(gca,'XTick',[19.35:0.01:19.45]);
% %set(gca,'YTick',[16000:2000:34000]);
% 
% % グリッドを表示
% grid on;
% 
% % 凡例を表示
% %legend('Laser','Enc','Model');
% legend('35 mm','45 mm','5555 mm');
% %%
% figure(11);
% load('156_green_2_1_0.mat');
% time3= green_2_1_0.X.Data(ini3:las3);
% enc = green_2_1_0.Y(2).Data(ini3:las3);
% plot(time3,enc,'r-','LineWidth',2.0); hold on;
% plot(time3,green_2_1_0.Y(5).Data(ini3:las3),'g-','LineWidth',2.0); hold on;
% plot(time3,green_2_1_0.Y(6).Data(ini3:las3),'b-','LineWidth',2.0); hold on;
% % グラフ上のテキストのフォントを指定
% set(gca,'FontName','Arial');
% set(gca,'FontSize',12);
% axis([1 10 -0.0025 0.0025]);
% % タイトルなどを描画
% title('');
% xlabel('Time[s]');
% ylabel('Stroke[m]');
% set(gca,'FontSize',26);
% grid on;
% legend('Encoder','Laser','Analysis');
% %%
% % load('358_green_random_c40.mat');
% % 
% % targetinitial4=1;
% % targetend4=17;%12-14.1
% % 
% % ini4=(targetinitial4+samplingtime)/samplingtime;
% % las4=(targetend4+samplingtime)/samplingtime;
% % 
% %  time4= green_random_c40.X.Data(ini4:las4);
% % stroke4 = lowpass(green_random_c40.Y(3).Data,20,500);
% % %stroke1 = lowpass(rec.Y(3).Data,20,500);
% % velocity4=diff(stroke4)/0.002;
% % %velocity1=lowpass(velocity1,20,500);
% % velocity4=filter(b,a,velocity4);
% % 
% % stroke4 = stroke4(ini4+okure:las4+okure);
% % velocity4=velocity4(ini4+okure:las4+okure);
% % %force1 = rec.Y(5).Data;
% % force4 = lowpass(green_random_c40.Y(5).Data,20,500);
% % force4=filter(b,a,force4);
% % force4 = -force4(ini4:las4);
% % 
% % figure(12);
% % 
% % plot(stroke4,force4,color1,'LineWidth',2.0); hold on;
% % 
% % set(gca,'FontName','Arial');
% % set(gca,'FontSize',12);
% % 
% % % タイトルなどを描画
% % title('');
% % xlabel('Stroke[m]');
% % ylabel('DampingForce[N]');
% % 
% % % テキストサイズを変更
% % set(gca,'FontSize',26);
% % 
% % % グラフの軸範囲と軸刻みを指定
% % axis([-0.007 0.007 -20 20]);
% % %set(gca,'XTick',[19.35:0.01:19.45]);
% % %set(gca,'YTick',[16000:2000:34000]);
% % 
% % % グリッドを表示
% % grid on;
%lowpass(name1.Y(2).Data,20,500);
% 
%  figure(6);
% ookure=10;
% plot(name3.Y(5).Data(1000+ookure:2000+ookure),name3.Y(2).Data(1000:2000));
% figure(7);
% %oookure=-2;
% aiu=lowpass(name1.Y(6).Data,20,500);
%  plot(name1.X.Data(1000:2000),name1.Y(6).Data(1000:2000));hold on;
%  plot(name1.X.Data(1000:2000),aiu(1000:2000));hold on;
%  
 
wave1.time=[];
wave1.signals.dimensions =1;
wave1.signals.values=transpose(stroke5);

wave.time=[];
wave.signals.dimensions =1;
wave.signals.values=transpose(velocity5);

wavef.time=[];
wavef.signals.dimensions =1;
wavef.signals.values=transpose(force5);




