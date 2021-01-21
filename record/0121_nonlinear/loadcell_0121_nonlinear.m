clear; 
close all;

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
        l = j+1;
        q = int2str(l);
        
        filename = ['0121_',p,'_',q];
        load(filename)
        
        if (i == 0 && j == 0) || (i == 1 && j == 0)
            
            Time = mat_saving1.X.Data;
            F_raw = mat_saving1.Y(1).Data;
            F_lowpass = mat_saving1.Y(2).Data;
            fc = mat_saving1.Y(6).Data;
        else
        
            Time = rec.X.Data;
            F_raw = rec.Y(1).Data;
            F_lowpass = rec.Y(2).Data;
            fc = rec.Y(6).Data;
        end
               
        start_time = 9;
        end_time = start_time+2;
        
        s = i*3+l;
        height = 240;
        width = 300;

        % --グラフ化--
                   
        figure(s);
        plot(Time(:), F_lowpass(:), 'color', blue, 'LineWidth', 2.0); hold on;
        plot(Time(:), fc(:), 'color', green, 'LineWidth', 2.0); hold on;
        set(gca, 'FontName', 'Times New Roman');
        set(gca, 'FontSize', 12);
        set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
        axis([start_time,end_time, -2,2]); grid on;
        xlabel('T [s]');
        xticklabels({'0', '0.5', '1', '1.5', '2'});
        ylabel('Damper force [N/m]');
        legend('Measurement', 'Damper model', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
        hold off;        
    end
end