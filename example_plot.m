xx = damFileRead(fullFileName); % Read .dam file, replace fullFileName with file path to a .dam file

samples = 1:24415; 
Fs=24.4140625; 
t=samples/Fs; 
yy = (mean(horzcat(xx.signal),2)); % Concatenate arrays horizontally to average across 2nd dimension
z = range(yy)/3276.5;

smooth_signal = sgolayfilt(yy/3276.5, 2, 701); % Savitsky-Golay filter
maxim = max(smooth_signal);

% Plot unaltered ASR waveform
subplot(2,1,1), plot(t,smooth_signal);
xlim([0,650])
ylim([-1.8,1.8])
set(gca,'xticklabel',[]),set(gca,'yticklabel',[])
set(gca,'xtick',[]), set(gca,'ytick',[])
ylabel("Voltage (V)")
axh = gca; 
color = 'k';
linestyle = '-';
line(get(axh,'XLim'), [0 0], 'Color', color, 'LineStyle', linestyle);

% Plot absolute value ASR waveform 
subplot(2,1,2), plot(t,abs(smooth_signal))
xlim([0,650])
ylim([-1.8,1.8])
set(gca,'xticklabel',[]),set(gca,'yticklabel',[])
set(gca,'xtick',[]), set(gca,'ytick',[])
ylabel("Voltage (V)")
xlabel("Time (ms)")
axh = gca;
color = 'k'; 
linestyle = '-'; 
line(get(axh,'XLim'), [0 0], 'Color', color, 'LineStyle', linestyle);



