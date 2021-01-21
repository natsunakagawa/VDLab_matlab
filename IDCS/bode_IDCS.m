    clear;
    close all;
%車両諸元    
    m1 = 1.5;
    m2 = 6.4;
    c2 = 5;
    k1 = 2200;
    k2 = 439;
    Kp = 50;
    
% sys1 : 2DOFモデル
    A=[ 0 0 1 0;
        0 0 0 1;
        -(k1+k2)/m1 k2/m1 -c2/m1 c2/m1;
        k2/m2 -k2/m2 c2/m2 -c2/m2; ];
    B=[0; 0; k1/m1; 0];
% 出力：ばね上-ばね下変位 x2-x1 相対変位 x0-x2
    C=[-1 1 0 0;
        0 -1 0 0;];
    D=[0; 1];
    sys1=ss(A,B,C,D);

% sys2: IDCS制御系
    A1=[ 0 1;
        -(k1+k2+Kp*k1)/m1 -c2/m1 ];
    B1=[0; Kp*k1/m1];
% 出力：ばね上-ばね下変位 x2-x1 操作量u
    C1=[1 0;
        -Kp 0];
    D1=[0; Kp];
    sys2=ss(A1,B1,C1,D1);
    
% sys3: ばね上固定の1DOFモデル
    A2=[ 0 1;
        -(k1+k2)/m1 -c2/m1 ];
    B2=[0; k1/m1];
% 出力：ばね上-ばね下変位 x2-x1
    C2=[1 0];
    D2=[0];
    sys3=ss(A2,B2,C2,D2);
    
% ダンパストロークを一致
% 逆伝達関数
    tf_invtf = series(tf(sys1(1)),inv(tf(sys3)));
    sys_invtf = series(tf_invtf, sys3);
% ローパスフィルタ
    cutoff = 20;
    T_diff = 1/(2*pi*cutoff);
    
    num = [-m1 -c2 -(k1+k2)];
    den = [T_diff^3*k1 3*T_diff^2*k1 3*T_diff*k1 k1];
    [A,B,C,D] = tf2ss(num,den);
    lowpass = ss(A,B,C,D);
    
    tf_lowpass = series(sys1(1),lowpass, 1, 1);
    sys_invtf_lowpass = series(tf_lowpass, sys3);
    
% IDCS
    tf_IDCS = series(sys1,sys2, 1, 1);
    sys_IDCS=series(tf_IDCS,sys3, 2, 1);
        
% 相対変位
    sys_relative = series(sys1, sys3, 2, 1);
    
    
% ボード線図描画

%     % 各システムの比較
%     figure(1)
%     plot_bode(sys_relative,[0 1 0]); hold on;
%     plot_bode(sys_IDCS, [0 0 1]); hold on;
%     set(gcf, 'Position', [20, 100, 480, 480]);
%     legend('relative', 'IDCS', 'Position', [0.75, 0.4, 0.2, 0.1]);
    
%     % 逆伝達関数比較
%     figure(2)
%     plot_bode(tf_invtf, [1 0 0]); hold on;
%     plot_bode(tf_lowpass, [0 1 0]); hold on;
%     legend('Hardware input', 'Hardware input(lowpass)', 'Location', 'SouthEast');
%     
%     figure(3)
%     plot_bode(sys_invtf, [1 0 0]); hold on;
%     plot_bode(sys_invtf_lowpass, [0 1 0]); hold on;
%     legend('Hardware output', 'Hardware output(lowpass)', 'Location', 'SouthEast');
%     
%     % 逆伝達関数
%     figure(4)
%     plot_bode(sys1(1), [1 0 0]); hold on;
%     plot_bode(inv(tf(sys3)), [0 1 0]); hold on;
%     plot_bode(tf_invtf, [0 0 1]); hold on;
%     legend('2DOF output', 'Hardware inverse', 'Hardware input', 'Location', 'SouthEast');
%     
%     % IDCS
%     figure(5)
%     plot_bode(sys1(1), [1 0 0]); hold on;
%     plot_bode(sys2(2), [0 1 0]); hold on;
%     plot_bode(sys_IDCS, [0 0 1]); hold on;
%     legend('2DOF output', 'IDCS', 'Hardware output', 'Location', 'SouthEast');
%     
%     % 相対変位
%     figure(6)
%     plot_bode(sys1(2), [1 0 0]); hold on;
% %     plot_bode(sys_relative, [0 1 0]); hold on;
%     legend('relative(x_0-x_2)', 'Hardware output', 'Location', 'SouthEast');
    
%     % 試験機への入力
%     figure(7)
%     plot_bode(sys1(2), [1 0 0]); hold on;
%     plot_bode(tf_IDCS(2), [0 0 1]); hold on;
% %     plot_bode(tf_lowpass, [0 0 1]); hold on;
%     set(gcf, 'Position', [600, 100, 480, 480]);
%     legend('relative', 'IDCS', 'Position', [0.75, 0.17, 0.2, 0.1]);
    
%     % 逆伝達関数とIDCSの比較
%     figure(8)
%     plot_bode(sys_invtf, [1 0 0]); hold on;
%     plot_bode(sys_invtf_lowpass, [0 1 0]); hold on;
%     plot_bode(sys_IDCS, [0 0 1]); hold on;
%     legend('inverse transferfnc', 'inverse transferfnc(lowpass)', 'IDCS', 'Location', 'SouthEast');
%     
    figure(9)
    plot_bode(inv(tf(sys3)), [0 1 0]); hold on;
    plot_bode(sys2(2), [0 0 1]); hold on;
    set(gcf, 'Position', [600, 100, 480, 480]);
    legend('inverse transferfcn', 'IDCS', 'Position', [0.55, 0.17, 0.38, 0.1]);

%    figure(10)
%    plot_bode(sys3, [1 0 0.8]); hold on;
%    set(gcf, 'Position', [20, 100, 480, 480]);
%    legend('Hardware', 'Position', [0.75, 0.16, 0.2, 0.07])
    
    function plot_bode(sys,color)
% ボード線図の描画
    freq = logspace(-2,2,10000);
    [mag,phase,w]=bode(sys,2*pi*freq);
    mag=squeeze(mag);
    phase=squeeze(phase);
    
    set(gcf, 'Position', [150 150 480 480]);
    % ボード線図をプロット
    subplot(2,1,1);
    % set(gcf, 'Position', [1000 400 640 480]);
    % semilogx(freq, mag, 'color',color_in, 'linewidth', 2.0); hold on;
    loglog(freq, mag, 'color',color, 'linewidth', 2.0); hold on;
    
    set(gcf, 'Color', [0.9 0.9 0.9]);
    set(gca, 'FontName','Times New Roman');
%     set(gca, 'FontName','Arial');
    set(gca, 'FontSize',18);
    xlabel('Frequency [Hz]');
    ylabel('Gain [dB]');
%     title('K_p=100');
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
    set(gca, 'FontSize',18);
    xlabel('Frequency [Hz]');
    ylabel('Phase [deg]');
    axis([10^(-1) 10^2 -720 0]);
    set(gca, 'XTick', [10^(-1) 10^0 10^1 10^2]);
    yticks([-720:180:0]);
    grid on;
    
end

