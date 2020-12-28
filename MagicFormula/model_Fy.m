function model_Fy

%係数
a0 = 1.30; a1 = -2.74e-2; a2 = 1.05; a3 = 1.18;
a4 = 7.69; a5 =  9.00e-3; a6 = -2.57e-1; a7 = 2.24e-1;
a8 = 2.50e-2; a9 = 1.00e-2; a10 = 1.50e-2; a11 = 8.49e-3;
a12 = -1.03e-2; a13 = 3.95e-2;

%入力値
Fz = 5; %輪荷重[kn]可変
alpha = [-15:0.1:15]; %スリップ角[deg]横軸
gamma = 0; %キャンバ角

%各定数
mu_y = a1*Fz + a2;
Dy = mu_y*Fz;
Cy = a0;
BCDy = a3 * sin(2*atan(Fz/a4)) * (1 - a5*abs(gamma));
By = BCDy/(Cy*Dy);
Ey = a5*Fz + a7;
Shy = a8*gamma + a9*Fz + a10;
Svy = a11*Fz*gamma + a12*Fz + a13;


x = alpha + Shy;
Fy_x = Dy*sin(Cy*atan(By*x - Ey*(By*x - atan(By*x))));
y = Fy_x + Svy;

save('Fy_params.mat', 'x', 'y');

end