clear; 
close all;

% Data ------------------
% 3_3, 5_1, 5_2 が優秀

% Color -------------------------------------------------------------------
black = [0 0 0];
blue = [0/255 0/255 255/255];
red = [255/255 0/255 0/255];
green = [0/255 200/255 0/255];
purple = [200/255 0/255 255/255];
yellow = [255/255 200/255 0/255];
lightblue = [0/255 200/255 255/255];

for i = 0:1
    k = i*2+3;
    p = int2str(k);
    for j = 0:2
        if i==1 && j==2
            break;
        end
        l = j+1;
        q = int2str(l);
        
        filename = ['0103_',p,'_',q];
        load(filename)
        
        Time = rec.X.Data;
        Fc = rec.Y(8).Data;
        F_raw = rec.Y(1).Data;
        F_lowpass = rec.Y(2).Data;

        fc = 10;
        fs = 500;
        % pass_Hz = 10;
        % x = lowpass(x_raw, pass_Hz, 1/fs);
        [b,a] = butter(2, fc/(fs/2));

        start_time = 7;
        end_time = start_time+2;
        
        s = i*3+l;
        height = 240;
        width = 300;

        % --グラフ化--
        figure(s);
        plot(Time(:), F_raw(:), 'color', blue, 'LineWidth', 2.0); hold on;
        plot(Time(:), F_lowpass(:), 'color', red, 'LineWidth', 2.0); hold on;
        set(gca, 'FontName', 'Times New Roman');
        set(gca, 'FontSize', 12);
        set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
        axis([start_time,end_time, -2,2]); grid on;
        xlabel('T [s]');
        % xticklabels({'0', '1', '2'});
        ylabel('Damper force [N/m]');
        legend('raw', 'lowpass(20Hz)', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
        hold off;
    end
end   
        

