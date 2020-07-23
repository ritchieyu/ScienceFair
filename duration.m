xx = damFileRead(fullFileName); % Read .dam file
samples = 1:24415;
yy = (mean(horzcat(xx.signal),2));
y_values = yy/3276.7;
smooth_signal = sgolayfilt(y_values, 2, 201); % Savitsky-Golay filter

% Algorithm for determining half peak locations
abs_y = abs(smooth_signal);
time = samples/24.4140625;
b_index = find(time <= 300);
b_avg = sum(abs(smooth_signal(b_index)))/length(b_index);
half_peak = ((max(abs_y)) - b_avg)/2;
locations = find(abs_y > 0.985*half_peak & abs_y < 1.015*half_peak);
loc_keep = find(locations > 300*24.4140625 & locations < 500*24.4140625);
duration = time(locations(loc_keep(end))) - time(locations(loc_keep(1))); % Acoustic startle response duration
