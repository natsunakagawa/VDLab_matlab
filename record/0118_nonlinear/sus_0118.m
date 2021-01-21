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

start_time = 14;
end_time = start_time+2;


for i = 0:1
    k = i*2+3;
    p = int2str(k);
    for j = 0:2
        l = j+1;
        q = int2str(l);
        
        filename = ['0118_',p,'_',q];
        load(filename)
        
        Time = rec.X.Data;
        x_idcs = rec.Y(3).Data * (-1000);
        x_lowpass = rec.Y(4).Data * (-1000);
        x_raw = rec.Y(5).Data * (-1000);
        u = rec.Y(8).Data * 1000;
        x0 = rec.Y(9).Data * 1000;
        r = rec.Y(10).Data * (-1000);

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
            axis([start_time, end_time, -10,10]); grid on;
            set(gca, 'FontName', 'Times New Roman');
            set(gca, 'FontSize', 12);
            set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
            xlabel('T [s]');
            ylabel('x_2 - x_1 [mm]');
            xticklabels({'0', '0.5', '1', '1.5', '2'});
            legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.65 0.85 0.3 0.1]);
            hold off;
        
        else
            figure(s);
            plot(Time(:), x(:), 'color', blue, 'LineWidth', 3.0); hold on;
            plot(Time(:), r(:), 'color', red, 'LineWidth', 2.0); hold on;
            axis([start_time, end_time, -10,10]); grid on;
            set(gca, 'FontName', 'Times New Roman');
            set(gca, 'FontSize', 12);
            set(gcf, 'Position', [50+(j*width)+(j*50), 400-(i*height)-(i*100), width, height]);
            xlabel('T [s]');
            ylabel('x_2 - x_1 [mm]');
            xticklabels({'0', '0.5', '1', '1.5', '2'});
            legend('Hardware', 'Analysis', 'FontName', 'Times New Roman', 'Position',[0.65 0.85 0.3 0.1]);
            hold off;
        end        
    end
end   
        

