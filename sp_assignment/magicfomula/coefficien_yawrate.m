function [a0, a1, b0, b1] = coefficien_yawrate(m, Iz, Kf, Kr, lf, lr, V)

V = V*(1000/(60*60));

for s = 1:length(V)
a11(1,s) = (-2*(Kf+Kr))/(m*V(1,s));
a12(1,s) = -1 - (2*(lf*Kf - lr+Kr))/(m*(V(1,s))^2);
a21(1,s) = (-2*(lf*Kf - lr*Kr))/Iz;
a22(1,s) = -(2*(lf^2*Kf + lr^2*Kr))/(Iz*V(1,s));
b11(1,s) = (2*Kf)/(m*V(1,s));
b21(1,s) = (2*lf*Kf)/Iz;
end

a0 = a11.*a22 - a12.*a21;
a1 = -a11-a22;
b0 = a21.*b11 - a11.*b21;
b1 = b21;

end