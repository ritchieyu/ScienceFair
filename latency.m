xx = damFileRead(fullFileName); % Read .dam files
samples = 1:24415;
yy = (mean(horzcat(xx.signal),2));
smooth_signal = sgolayfilt(yy/3276.5, 2, 201);

% Algorithm for determining startle latency
maxim = max(abs(smooth_signal));
[pks, locs] = findpeaks(abs(smooth_signal), samples, 'MinPeakHeight', 0.6*maxim, 'MinPeakDistance', 300);
index = find(abs(smooth_signal) == pks(1));
raw_x = samples(index);
lat_x = raw_x/24.4140625;
latency = lat_x - 300; % Acoustic startle response latency 
