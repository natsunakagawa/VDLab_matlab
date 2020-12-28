function plot_position(m, Iz, Kf, Kr, lf, lr, V)

fig = figure;
[a0, a1, b0, b1] = coefficien_yawrate(m, Iz, Kf, Kr, lf, lr, V);
simout = sim('analysis_yawrate');

for s = 1:length(V)
    plot(simout.position.Data(:,s+6),simout.position.Data(:,s), 'LineWidth', 1.25); hold on
end

hold off;
grid on;
axis([-300,300,0,600]);
title('Fig4. Position'); xlabel('X(m)'); ylabel('Y(m)');
legend('V = 30  km/h','V = 60  km/h', 'V = 90  km/h','V = 120 km/h','V = 150 km/h','V = 180 km/h')
end