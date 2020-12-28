function plot_lateral_accelration(m, Iz, Kf, Kr, lf, lr, V)

fig = figure;
[a0, a1, b0, b1, b2] = coefficien_lateral_accelration(m, Iz, Kf, Kr, lf, lr, V);
simout = sim('analysis_lateral_accelration');

for s = 1:length(V)
    plot(simout.lateral_accelration.Time(:,1),simout.lateral_accelration.Data(:,s), 'LineWidth', 1.25); hold on
end

hold off;
axis([0,3,0,2800]);
grid on;
title('Fig3. Lateral accelration'); xlabel('T(s)'); ylabel('a(m/s^2)');
legend('V = 30  km/h','V = 60  km/h', 'V = 90  km/h','V = 120 km/h','V = 150 km/h','V = 180 km/h')
end