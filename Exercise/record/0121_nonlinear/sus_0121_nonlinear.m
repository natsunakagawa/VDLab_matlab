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

start_time = 13;
end_time = start_time+2;


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
            r = mat_saving1.Y(10).Data * 1000;
            x_raw = mat_saving1.Y(5).Data * 1000;
            x_lowpass = mat_saving1.Y(4).Data * 1000;
            u = mat_saving1.Y(8).Data * 1000;
        else
        
            Time = rec.X.Data;
            r = rec.Y(10).Data * 1000;
            x_raw = rec.Y(5).Data * 1000;
            x_lowpass = rec.Y(4).Data * 1000;
            u = rec.Y(8).Data * 1000;
        end
        
        fc = 10;
        fs = 1/0.004;
        % pass_Hz = 10;
        % x = lowpass(x_raw, pass_Hz, 1/fs);
        [b,a] = butter(2, fc/(fs/2));
        x = filter(b,a,x_raw);
        r = filter(b,a,r);
        
        s = i*3+l;
        height = 240;
        width = 300;

        % --グラフ化--
        if i == 0
            figure(s);
            plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
            plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
            set(gca, 'FontName', 'Times New Roman');
            set(gca, 'FontSize', 14);
            set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
            axis([start_time,end_time, -10,10]); grid on;
            xlabel('T [s]');
            % xticklabels({'0', '1', '2'});
            ylabel('x_2-x_1 [mm]');
            legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
            hold off;
        else
            figure(s);
            plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
            plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
            set(gca, 'FontName', 'Times New Roman');
            set(gca, 'FontSize', 14);
            set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
            axis([start_time,end_time, -15,15]); grid on;
            xlabel('T [s]');
            % xticklabels({'0', '1', '2'});
            ylabel('x_2-x_1 [mm]');
            legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.6 0.85 0.3 0.1]);
            hold off;
        end
    end
end