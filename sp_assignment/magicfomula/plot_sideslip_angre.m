function plot_sideslip_angre(m, Iz, Kf, Kr, lf, lr, V)

fig = figure
[a0, a1, b0, b1] = coefficien_sideslip_angre(m, Iz, Kf, Kr, lf, lr, V);
simout = sim('analysis_sideslip_angre');

for s = 1:length(V)
    plot(simout.sideslip_angre.Time(:,1),simout.sideslip_angre.Data(:,s), 'LineWidth', 1.25); hold on
end

hold off;
axis([0,0.3,-1.6,0.2]);
grid on;
title('Fig2. Sideslip angre'); xlabel('T(s)'); ylabel('deg(Åã)');
legend('V = 30  km/h','V = 60  km/h', 'V = 90  km/h','V = 120 km/h','V = 150 km/h','V = 180 km/h')
end