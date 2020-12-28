function re_yawrate(V)
simout = sim('block_yawrate');

for s = 1:length(V)
    plot(simout.yawrate.Time(:,1),simout.yawrate.Data(:,s), 'LineWidth', 1.25); hold on;
end

hold off;
axis([0,1.5,0,14]);
grid on;
title('Fig1. Yawrate'); xlabel('T(s)'); ylabel('Yawrate');
legend('V = 30  km/h','V = 60  km/h', 'V = 90  km/h','V = 120 km/h','V = 150 km/h','V = 180 km/h')
end