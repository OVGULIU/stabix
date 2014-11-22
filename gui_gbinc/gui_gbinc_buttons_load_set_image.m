% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function handles = gui_gbinc_buttons_load_set_image(...
    x0, hu, wu, image, filename_picture)
%% Function to create buttons/boxes for the loading/setting of images
% x0: origin of x coordinate
% hu: heigth unit
% wu: width unit
% image: 1 for before polishing and 2 after polishing
% filename_picture: filename of the picture

% authors: d.mercier@mpie.de / c.zambaldi@mpie.de

str_loading = strcat('LOAD Image #', num2str(image));
callback_loading = strcat('gui_gbinc_import_image(', num2str(image),')');

callback_calibration_dist = ...
    strcat('gui_gbinc_calib_distance(', num2str(image),');');

callback_calibration = ...
    strcat('gui_gbinc_scale_calibration(', num2str(image),');');

str_edge_detection = strcat('EDGE DETECTION #', num2str(image));
callback_edge_detection = ...
    strcat('gui_gbinc_edge_detection(', num2str(image),');');

h = uibuttongroup('visible','on','Position',[x0 hu*7.5 wu*3 x0*24]);

parent = h;
x0 = 0.01;
hu = 0.1; % height unit
wu = 0.1; % width unit

%% Loading
handles.pb_ImpImage = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'pushbutton',...
    'Position', [x0 hu*8 wu*9.75 x0*20],...
    'String', str_loading,...
    'Callback', callback_loading);

handles.edit_ImpImageFile = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0 hu*6 wu*9.75 x0*20],...
    'String', filename_picture,...
    'BackgroundColor', [1 1 1],...
    'HorizontalAlignment', 'left');

%% Calibration
handles.pb_Calibration_distance = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'pushbutton',...
    'Position', [x0 hu*3.5 wu*3 x0*20],...
    'String', 'CALIBRATION DISTANCE',...
    'Callback', callback_calibration_dist);

handles.pb_Calibration = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'pushbutton',...
    'Position', [x0*32 hu*3.5 wu*1.5 x0*20],...
    'String', 'SET',...
    'Callback', callback_calibration);

handles.scale_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*49 hu*4.5 wu*2 x0*10],...
    'String', 'Scale value',...
    'HorizontalAlignment', 'left');

handles.scale_value = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0*49 hu*3.6 wu*1.2 x0*10],...
    'String', '100',...
    'BackgroundColor', [1 1 1]);

handles.scale_unit = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*63 hu*3.6 wu*1.2 x0*10],...
    'String', '�m',...
    'HorizontalAlignment', 'left');

handles.scale_factor_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*72 hu*4.5 wu*2 x0*10],...
    'String', 'Factor scale',...
    'HorizontalAlignment','left');

handles.scale_factor_value = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0*72 hu*3.6 wu*1.2 x0*10],...
    'String', '',...
    'BackgroundColor', [1 1 1]);

handles.scale_factor_unit = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*85 hu*3.6 wu*1.2 x0*10],...
    'String', '�m/pixel',...
    'HorizontalAlignment', 'left');

%% Edge detection
handles.pb_edge_detection = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'pushbutton',...
    'Position', [x0 hu wu*3 x0*20],...
    'String', str_edge_detection,...
    'Callback', callback_edge_detection);

handles.edge_detection_algo_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0+wu*3.2 hu*1.9 wu*3 x0*10],...
    'String', 'Algorithm',...
    'HorizontalAlignment', 'left');

handles.edge_detection_algo = uicontrol('Parent', parent,...
    'Units','normalized',...
    'Style', 'popupmenu',...
    'Position', [x0+wu*3.2 hu*1.1 wu*3 x0*10],...
    'String', 'sobel|prewitt|roberts|canny|log',...
    'BackgroundColor', [1 1 1],...
    'Value', 1,...
    'Callback', callback_edge_detection);

handles.edge_detection_threshold_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style','text',...
    'Position', [x0+wu*6.5 hu*1.9 wu*3 x0*10],...
    'String', 'Threshold',...
    'HorizontalAlignment', 'left');

handles.edge_detection_threshold_value = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0+wu*6.5 hu*1.1 wu*3 x0*10],...
    'String', '0.01',...
    'BackgroundColor', [1 1 1],...
    'Callback', callback_edge_detection);

end