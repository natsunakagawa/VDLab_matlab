    clear;
    close all;
%車両諸元    
    m1 = 1.5;
    m2 = 6.4;
    c2 = 7;
    k1 = 2200;
    k2 = 405;        
    
% sys1 : 2DOFモデル
    A=[ 0 0 1 0;
        0 0 0 1;
        -(k1+k2)/m1 k2/m1 -c2/m1 c2/m1;
        k2/m2 -k2/m2 c2/m2 -c2/m2; ];
    B=[0; 0; k1/m1; 0];
% 出力：相対変位 x2-x1
    C=[-1 1 0 0];
    D=[0];
    sys1_damper=ss(A,B,C,D);
    
% sys3: ばね上固定の1DOFモデル
    A1=[ 0 1;
        -(k1+k2)/m1 -c2/m1 ];
    B1=[0; k1/m1];
% 出力：ばね上-ばね下変位 x2-x1
    C1=[-1 0];
    D1=[0];
    sys3_damper=ss(A1,B1,C1,D1);
    
% ダンパストロークを一致：
    tf_uu_damper = series(tf(sys1_damper),inv(tf(sys3_damper)));
    sys2to1=series(tf_uu_damper,sys3_damper);
    
    cutoff = 20;
    T_diff = 1/(2*pi*cutoff);
    
    num = [-m1 -c2 -(k1+k2)];
    den = [T_diff^3*k1 3*T_diff^2*k1 3*T_diff*k1 k1];
    [A,B,C,D] = tf2ss(num,den);
    sys = ss(A,B,C,D);
    
    
    figure(1)
    plot_bode(sys1_damper,[1 0 0])
    figure(11)
    bode(sys1_damper)
    
    figure(2)
    plot_bode(tf_uu_damper,[1 0 0])
    figure(22)
    bode(tf_uu_damper)
    
    figure(6)
    tf_uu_damper = series(tf(sys1_damper),inv(tf(sys)));
    plot_bode(tf_uu_damper,[1 0 0])
    figure(66)
    bode(tf_uu_damper)
        
    figure(5)
    plot_bode(sys3_damper,[1 0 0])
        
    figure(3)
    plot_bode(sys,[1 0 0]);
    figure(4)
    bode(sys)
    
function plot_bode(sys,color)
% ボード線図の描画
    freq = logspace(-2,2,10000);
    [mag,phase,w]=bode(sys,2*pi*freq);
    mag=squeeze(mag);
    phase=squeeze(phase);
    
    set(gcf, 'Position', [100 100 350 400]);
    % ボード線図をプロット
    subplot(2,1,1);
    % set(gcf, 'Position', [1000 400 640 480]);
    % semilogx(freq, mag, 'color',color_in, 'linewidth', 2.0); hold on;
    loglog(freq, mag, 'color',color, 'linewidth', 2.0); hold on;
    
    set(gcf, 'Color', [0.9 0.9 0.9]);
    set(gca, 'FontName','Times New Roman');
%     set(gca, 'FontName','Arial');
    set(gca, 'FontSize',12);
    xlabel('Frequency [Hz]');
    ylabel('Gain [-]');
    axis([10^(-1) 100 10^(-3) 100]);
    set(gca, 'XTick', [10^(-1) 10^0 10^1 10^2]);
    set(gca, 'YTick', [10^(-3) 10^(-2) 10^(-1) 10^0 10^1 10^2]);
%     set(gca, 'YTick', [0.1 1 10]);
%     legend('k_1=820','k_1=500','Location','NorthEast');
%     legend('k_1=2200','k_1=1000','Location','SouthEast');
%     legend('ζ=0.3','ζ=0.4','ζ=0.5','Location','SouthEast');
    grid on;

    subplot(2,1,2);
    % set(gcf, 'Position', [1000 400 640 480]);
    semilogx(freq, phase-360, 'color',color, 'linewidth', 2.0); hold on;
%     semilogx(freq, phase-180, 'color',color, 'linewidth', 2.0); hold on;      
    
    set(gcf, 'Color', [0.9 0.9 0.9]);
    set(gca, 'FontName','Times New Roman');
%     set(gca, 'FontName','Arial');
    set(gca, 'FontSize',12);
    xlabel('Frequency [Hz]');
    ylabel('Phase [deg]');
    axis([10^(-1) 10^2 -720 0]);
    set(gca, 'XTick', [10^(-1) 10^0 10^1 10^2]);
    yticks([-720:180:0]);
    grid on;
    
end

