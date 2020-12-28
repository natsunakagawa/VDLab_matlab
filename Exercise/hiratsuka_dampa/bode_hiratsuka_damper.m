clear;
close all;


% パラメータ(dampa) ------------------------------------------------------
A = 1; % [mm]
Ao = (0.70*0.001)^2*pi/4;
Ar = 0.38*10^-6;
Aor = 0.1*10^-6;
Ap = (32.50*0.001)^2*pi/4;
kappaaa = 1.4-1.4*(Aor/Ap);
kappa = 1.4;
x0 = 0.05;
P0 = 101325;
row0 = 1.1841;
T = 0.005;
Cor = 0.8;
Fmax = 15;
Vmax = 0.1;
B = 0;

swt = 0; %スイッチ

%　ボード線図を求める周波数ベクトル[rad/s]
wv = [logspace(-1,0,10),logspace(0,1,30),logspace(1,2,10)];

%　シミュレーション・FFT用のパラメータ
num_data = 4350;
ts = 0.001;
tf_end = (num_data-1)*ts;

% 各周波数を入力とした時のシミュレーションと複素周波数応答を算出
for k = 1:length(wv) 
    Hz = wv(k);
    out = sim('hiratsuka_dampa_sim.slx');            % モデルの実行
    Pxx = fft(out.indata,num_data);                 % 入力データをFFT
    Pyy = fft(out.outdata,num_data);                % 出力データをFFT
    Pxy = (Pyy.*conj(Pxx))./(Pxx.*conj(Pxx));   % 複素周波数応答
    Pxy = Pxy(1:num_data/2);
    F = (0:num_data/2-1)*(1/ts)/num_data;       % 周波数ベクトル
    Pxy_w(k) =interp1(2*pi*F,Pxy,Hz);            % 入力周波数に対する複素周波数応答を計算
end

% 振幅・位相を計算
Mag_dB = 20*log10(abs(Pxy_w));
Ph = unwrap(angle(Pxy_w))/(pi/180);

% 結果の表示
figure(1)
subplot(211)
semilogx(wv,Mag_dB)
xlabel('Frequency (rad/s)'); ylabel('Magnitude (dB)');
xlim([0.1 100]); ylim([-100 20]);
subplot(212)
semilogx(wv,Ph)
xlabel('Frequency (rad/s)'); ylabel('Phase (deg)');
xlim([0.1 100]); ylim([-180 0]);