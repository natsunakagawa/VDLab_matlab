function model_Fx

%係数
b0 = 1.65; b1 = -1.29e-2; b2 = 1.10; b3 = 3.57;
b4 = 2.20e1; b5 = 1.27e-1; b6 = -4.00e-3; b7 = 4.70e-2;
b8 = 4.33e-1; b9 = -2.47e-3; b10 = 3.19e-3;

%入力値
Fz = 5; %軸荷重[kn]
kappa = [-0.2:0.01:0.2]; %スリップ比
gamma = 0; %キャンバ角

%各定数
mu_x = b1*Fz + b2;
Dx = mu_x*Fz;
BCDx = (b3*Fz^2 + b4*Fz) * exp(-b5*Fz);
Cx = b0;
Bx = BCDx/(Cx*Dx);
Ex = b5*Fz^2 + b7*Fz + b8;
Shx = b9*Fz + b10;
Svx = 0;

x = kappa + Shx;
Fx_x = Dx*sin(Cx*atan(Bx*x - Ex*(Bx*x - atan(Bx*x))));
y = Fx_x + Svx;

save('Fx_params.mat', 'x', 'y');
