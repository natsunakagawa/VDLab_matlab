function plot_model_Fy(v)

out = sim('tasukete.slx');

for s=1:length(v)
    plot(out.simout.Time(:,1),out.simout.Data(:,s), 'LineWidth', 1.25); hold on;
end

axis([20,60,7,10]); grid on;
title('Fig. ‰¡‰Á‘¬“x‚ÌŽû‘©’l(OS)'); xlabel('ŽžŠÔT(s)'); ylabel('‰¡‰Á‘¬“xa(m/s^2)'); hold off;
legend('V = 30  km/h','V = 60  km/h', 'V = 90  km/h','V = 120 km/h','V = 150 km/h','V = 180 km/h')

end