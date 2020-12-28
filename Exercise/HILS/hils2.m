function hils2()
    % 1/4車体モデルのボード線図プロットと時系列シミュレーション
    close all;

    % System Definition
    m1 = 30.0;   m2 = 300.0;
                 c2 = 1000;
    k1 = 180000; k2 = 30000;

    % sys1 : 2DOFモデル
    A=[ 0 0 1 0;
        0 0 0 1;
        -(k1+k2)/m1 k2/m1 -c2/m1 c2/m1;
        k2/m2 -k2/m2 c2/m2 -c2/m2; ];
    B=[0; 0; k1/m1; 0];

    % 出力：ばね下-路面変位 x1-x0
    C=[1 0 0 0];
    D=[-1];

    sys1_tire=ss(A,B,C,D);
   
    % 出力：ばね上-ばね下変位 x2-x1
    C=[-1 1 0 0];
    D=[0];

    sys1_damper=ss(A,B,C,D);
    
    % 出力：ばね上と地面の相対距離
    C=[0 1 0 0];
    D=[-1];
    sys1_rel=ss(A,B,C,D);

    %    sys3: ばね上固定の1DOFモデル
    A=[ 0 1;
        -(k1+k2)/m1 -c2/m1 ];
    B=[0; k1/m1];

    % 出力：ばね下-路面変位 x1-x0
    C=[1 0];
    D=[-1];
    sys3_tire=ss(A,B,C,D);
    
    % 出力：ばね上-ばね下変位 x2-x1
    C=[-1 0];
    D=[0];
    sys3_damper=ss(A,B,C,D);
    
    % 出力：ばね上と地面の相対距離
    C=[0 0];
    D=[-1];
    sys3_rel=ss(A,B,C,D);
    
    
% ばね下を一致させるならこちら
%     tf1=tf(sys1_tire);
%     tf2=tf(sys3_tire);
%     tf_uu = series(tf1,inv(tf2));
    
    % ばね下を一致させるならこちら：
    tf_uu_tire = series(tf(sys1_tire),inv(tf(sys3_tire)));
    % ダンパストロークを一致させるならこちら：
    tf_uu_damper = series(tf(sys1_damper),inv(tf(sys3_damper)));
    % ばね上と地面の相対距離を一致させるならこちら (これまでのHILS)
    tf_uu_rel = series(tf(sys1_rel),inv(tf(sys3_rel)));
    
%     figure(3);
%     plot_bode(tf_uu_tire,[1 0 0]); hold on;
%     plot_bode(tf_uu_damper,[0 0 1]); hold on;

    figure(1);
    set(gcf, 'Position', [100 600 1400 400]);
    subplot(1,3,1)
	plot_bode(sys1_tire,[1 0 0]);hold on;
	plot_bode(series(tf_uu_tire,sys3_tire),[0 1 0]);
    subplot(1,3,2)
	plot_bode(sys1_tire,[1 0 0]);hold on;
	plot_bode(series(tf_uu_damper,sys3_tire),[0 0 1]);
    subplot(1,3,3)
	plot_bode(sys1_tire,[1 0 0]);hold on;
	plot_bode(series(tf_uu_rel,sys3_tire),[0 1 1]);
    
    
    figure(2);
    set(gcf, 'Position', [100 100 1400 400]);
    subplot(1,3,1)
	plot_bode(sys1_damper,[1 0 0]);hold on;
	plot_bode(series(tf_uu_tire,sys3_damper),[0 1 0]);
    subplot(1,3,2)
	plot_bode(sys1_damper,[1 0 0]);hold on;
	plot_bode(series(tf_uu_damper,sys3_damper),[0 0 1]);
    subplot(1,3,3)
	plot_bode(sys1_damper,[1 0 0]);hold on;
	plot_bode(series(tf_uu_rel,sys3_damper),[0 1 1]);

    figure(3);
    set(gcf, 'Position', [100 100 500 360]);
	plot_bode(sys1_damper,[1 0 0]);hold on;
    legend('Output 1','Location','SouthEast');

    figure(4);
    set(gcf, 'Position', [100 100 500 360]);
    plot_bode(sys3_damper,[0 0.6 0]);
    legend('Output 2','Location','SouthEast');
    
    figure(5);
    set(gcf, 'Position', [100 100 500 360]);
	plot_bode(series(tf_uu_rel,sys3_damper),[0 0 1]);
    legend('Output 3','Location','SouthEast');

    figure(6);
    set(gcf, 'Position', [100 100 500 360]);
	plot_bode(sys1_damper,[1 0 0]);hold on; hold on;
	plot_bode(series(tf_uu_rel,sys3_damper),[0 0 1]);
    legend('Output 1','Output 3','Location','SouthEast');

end


function plot_bode(sys,color)
% ボード線図の描画

    freq = logspace(-1,2,1000);
    [mag,phase,w]=bode(sys,2*pi*freq);
    mag=squeeze(mag);

    % ボード線図をプロット
    loglog(freq, mag, 'color', color, 'linewidth', 2.0); hold on;

    % 見た目をきれいに
    set(gcf, 'Color', [0.9 0.9 0.9]);
    set(gca, 'FontName','Verdana');
    set(gca, 'FontSize',12);

    xlabel('Frequency [Hz]');
    ylabel('Gain');

    grid on;

end

