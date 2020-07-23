main_parent = '/Users/Ritchie/Desktop/Sci Fair/Data/Organized data';
mouse_list = dir(main_parent);

mouseNames = {mouse_list([mouse_list.isdir]).name}; 

mouseNames = mouseNames(~ismember(mouseNames,{'.','..'}));
mouseNames = char(mouseNames);

for p = 1:size(mouseNames,1)

    % folder_list contains everything in the parent folder
    mouse_folder = what(mouseNames(p,:));
    parent = mouse_folder.path;
    
    folder_list = dir(parent);

    % Remove non-directoriers so that directoryNames only contains directories
    directoryNames = {folder_list([folder_list.isdir]).name}; 

    % Remove '.' and '..'
    directoryNames = directoryNames(~ismember(directoryNames,{'.','..'}));
    directoryNames = char(directoryNames);

    % Create empty array
    names_ranges = cell(14,12);

    % Loop through directories
    for k = 1 : size(directoryNames,1)
        s = what(directoryNames(k,:));
        myFolder = s.path;
        filePattern = fullfile(myFolder, '*.dam');
        theFiles = dir(filePattern);
        sorted_files = char(sort_nat({theFiles.name}));
        
        % Perform analysis on files within each directory with algorithm for determining peak-to-peak amplitude
        for i = 1 : size(sorted_files,1)
            baseFileName = deblank(sorted_files(i,:));
            fullFileName = fullfile(directoryNames(k,:), baseFileName);
            xx = damFileRead(fullFileName); % Read .dam file
            samples = 1:24415;
            Fs = 24.4140625;
            t = samples/Fs;
            yy = (mean(horzcat(xx.signal),2)); % Concatenate arrays horizontally to average across 2nd dimension
            y_values = yy/3276.5;
            smooth_signal = sgolayfilt(y_values, 2, 201); % Savitsky golay filter
            z = range(smooth_signal);
            
            % Populate empty cell array 
            names_ranges{i,3*k-2} = baseFileName;
            names_ranges{i,3*k-1} = z;
        end
    end
    
   writecell(names_ranges,'rangedata.xlsx','sheet',p,'Range','A3:L22');
    
end

system('open rangedata.xlsx');
