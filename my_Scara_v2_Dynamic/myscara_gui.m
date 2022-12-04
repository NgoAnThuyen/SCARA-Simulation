function varargout = myscara_gui(varargin)
% MYSCARA_GUI MATLAB code for myscara_gui.fig
%      MYSCARA_GUI, by itself, creates a new MYSCARA_GUI or raises the existing
%      singleton*.
%
%      H = MYSCARA_GUI returns the handle to a new MYSCARA_GUI or the handle to
%      the existing singleton*.
%
%      MYSCARA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYSCARA_GUI.M with the given input arguments.
%
%      MYSCARA_GUI('Property','Value',...) creates a new MYSCARA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myscara_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myscara_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myscara_gui

% Last Modified by GUIDE v2.5 08-Jan-2021 08:38:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myscara_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @myscara_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT





% --- Executes just before myscara_gui is made visible.
function myscara_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myscara_gui (see VARARGIN)
%% visible off something
set(handles.edit_p1_x,'visible','off')
set(handles.edit_p2_x,'visible','off')
set(handles.edit_p3_x,'visible','off')

set(handles.edit_p1_y,'visible','off')
set(handles.edit_p2_y,'visible','off')
set(handles.edit_p3_y,'visible','off')

set(handles.edit_p1_z,'visible','off')
set(handles.edit_p2_z,'visible','off')
set(handles.edit_p3_z,'visible','off')

set(handles.edit_p1_roll,'visible','off')
set(handles.edit_p2_roll,'visible','off')
set(handles.edit_p3_roll,'visible','off')

set(handles.edit_p1_pitch,'visible','off')
set(handles.edit_p2_pitch,'visible','off')
set(handles.edit_p3_pitch,'visible','off')

set(handles.edit_p1_yaw,'visible','off')
set(handles.edit_p2_yaw,'visible','off')
set(handles.edit_p3_yaw,'visible','off')
pushbutton_trajectory_tab1_Callback(hObject, eventdata, handles)
% btn_Start_Callback(hObject, eventdata, handles)

%--------------------------------------------------------------------------
% dynamic_system = 'Dynamic.slx';
% load_system(dynamic_system);
% sim(dynamic_system);
% pause(2);
assignin('base','DynamicLoaded',0);
%--------------------------------------------------------------------------
handles.timer = timer('Name','MyTimer',               ...
                      'Period',0.1,                    ... 
                      'StartDelay',0,                 ... 
                      'TasksToExecute',inf,           ... 
                      'ExecutionMode','fixedSpacing', ...
                      'TimerFcn',{@timerCallback,handles}); 
% Choose default command line output for myscara_gui
handles.output = hObject;
old_data(1) = 0;  
old_data(2) = 0;  
old_data(3) = 0;  
old_data(4) = 0;  
assignin('base','old_data',old_data);
% Update handles structure
guidata(hObject, handles);
start(handles.timer);
% UIWAIT makes myscara_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myscara_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function timerCallback(hObject,event,handles)
plot_robot(handles);


function edit_a1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a1 as text
%        str2double(get(hObject,'String')) returns contents of edit_a1 as a double


% --- Executes during object creation, after setting all properties.
function edit_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2 as text
%        str2double(get(hObject,'String')) returns contents of edit_a2 as a double


% --- Executes during object creation, after setting all properties.
function edit_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_d3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.slider_d3, 'Max',0.33);
    set(handles.slider_d3, 'Min', 0);
    set(handles.slider_d3, 'SliderStep' , [1, 1] / 20 );
    sliderValue_d3 = get(handles.slider_d3,'Value');
    set(handles.edit_d3,'String',sliderValue_d3)
%     plot_robot(handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
   
end


% --- Executes on slider movement.
function slider_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.slider_theta1, 'Max', 180*2);
    set(handles.slider_theta1, 'Min', -180*2);
    set(handles.slider_theta1, 'SliderStep' , [1, 1] / 20 );
    sliderValue_theta1 = get(handles.slider_theta1,'Value');
    set(handles.edit_theta1,'String',sliderValue_theta1)
%     plot_robot(handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);

end


% --- Executes on slider movement.
function slider_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.slider_theta2, 'Max', 180*2);
    set(handles.slider_theta2, 'Min', -180*2);
    set(handles.slider_theta2, 'SliderStep' , [1, 1] / 20 );
    sliderValue_theta2 = get(handles.slider_theta2,'Value');
    set(handles.edit_theta2,'String',sliderValue_theta2)
%     plot_robot(handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);

end


% --- Executes on button press in btn_Start.
function btn_Start_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Dynamic/theta1_d','value',num2str(0));
set_param('Dynamic/theta2_d','value',num2str(pi/2));
set_param('Dynamic/theta4_d','value',num2str(0));
set_param('Dynamic/d3_d','value',num2str(0));
% plot_robot(handles)


% --- Executes on button press in checkbox_enable.

% Hint: get(hObject,'Value') returns toggle state of checkbox_enable



function edit_d3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d3 as text
%        str2double(get(hObject,'String')) returns contents of edit_d3 as a double


% --- Executes during object creation, after setting all properties.
function edit_d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta1 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta2 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta2 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_d4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d4 as text
%        str2double(get(hObject,'String')) returns contents of edit_d4 as a double


% --- Executes during object creation, after setting all properties.
function edit_d4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.slider_theta4, 'Max', 180*2);
    set(handles.slider_theta4, 'Min', -180*2);
    set(handles.slider_theta4, 'SliderStep' , [1, 1] / 20 );
    sliderValue_theta4 = get(handles.slider_theta4,'Value');
    set(handles.edit_theta4,'String',sliderValue_theta4)
%     plot_robot(handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   
% Hints: get(hObject,'String') returns contents of edit_theta4 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta4 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_x as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_x as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_z as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_z as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_p1_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p2_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_x as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_x as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p2_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p2_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_z as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_z as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p2_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_p2_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_p2_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p2_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p2_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_p2_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_p2_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p2_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_x as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_x as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p3_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_p3_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_x as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_x as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_z as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_z as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p4_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p4_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p4_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_p4_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_p4_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p4_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_c0.
function checkbox_c0_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_c0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot_robot(handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_c0


% --- Executes on button press in checkbox_c1.
function checkbox_c1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot_robot(handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_c1


% --- Executes on button press in checkbox_c2.
function checkbox_c2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot_robot(handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_c2


% --- Executes on button press in checkbox_c3.
function checkbox_c3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot_robot(handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_c3


% --- Executes on button press in checkbox_c4.
function checkbox_c4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plot_robot(handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_c4


% --- Executes on button press in pushbutton_InvDynamic.
function pushbutton_InvDynamic_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_InvDynamic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_process,'visible','on');
set(handles.edit_process,'visible','on');
Cal_inverse_dynamic(handles)


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_speed_Callback(hObject, eventdata, handles)
% hObject    handle to edit_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_speed as text
%        str2double(get(hObject,'String')) returns contents of edit_speed as a double


% --- Executes during object creation, after setting all properties.
function edit_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_rotate.
function checkbox_rotate_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_rotate



function edit_AZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AZ as text
%        str2double(get(hObject,'String')) returns contents of edit_AZ as a double


% --- Executes during object creation, after setting all properties.
function edit_AZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_EI_Callback(hObject, eventdata, handles)
% hObject    handle to edit_EI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_EI as text
%        str2double(get(hObject,'String')) returns contents of edit_EI as a double


% --- Executes during object creation, after setting all properties.
function edit_EI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_EI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_setview.
function btn_setview_Callback(hObject, eventdata, handles)
% hObject    handle to btn_setview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[az ,ei] = view;
set(handles.edit_AZ,'String',num2str(az) );
set(handles.edit_EI,'String',num2str(ei) );


% --- Executes on slider movement.
function slider_opacity_Callback(hObject, eventdata, handles)
% hObject    handle to slider_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.slider_opacity, 'Max', 1);
    set(handles.slider_opacity, 'Min', 0);
    set(handles.slider_opacity, 'SliderStep' , [1, 1] / 20 );
    sliderValue_opacity = get(handles.slider_opacity,'Value');
    set(handles.edit_opacity,'String',sliderValue_opacity)
%     plot_robot(handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_opacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_opacity_Callback(hObject, eventdata, handles)
% hObject    handle to edit_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_opacity as text
%        str2double(get(hObject,'String')) returns contents of edit_opacity as a double


% --- Executes during object creation, after setting all properties.
function edit_opacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_process_Callback(hObject, eventdata, handles)
% hObject    handle to edit_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_process as text
%        str2double(get(hObject,'String')) returns contents of edit_process as a double


% --- Executes during object creation, after setting all properties.
function edit_process_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_clear.
function btn_clear_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset')
hold on
grid on
close all
plot_trajectory(handles,1)
% plot_robot(handles);


% --- Executes on button press in togglebutton_clear.
function togglebutton_clear_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_clear


% --- Executes on button press in btn_plot_xyz.
function btn_plot_xyz_Callback(hObject, eventdata, handles)
% hObject    handle to btn_plot_xyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot_trajectory(handles,2)



function edit_v_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_v_max as text
%        str2double(get(hObject,'String')) returns contents of edit_v_max as a double


% --- Executes during object creation, after setting all properties.
function edit_v_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a_max as text
%        str2double(get(hObject,'String')) returns contents of edit_a_max as a double


% --- Executes during object creation, after setting all properties.
function edit_a_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Trajectory2(handles)



function edit_q_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_q_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_q_max as text
%        str2double(get(hObject,'String')) returns contents of edit_q_max as a double


% --- Executes during object creation, after setting all properties.
function edit_q_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_q_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_linear.
function radiobutton_linear_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_linear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton_circular,'value',0);
set(handles.radiobutton_2d_circular,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton_linear


% --- Executes on button press in radiobutton_circular.
function radiobutton_circular_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_circular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton_linear,'value',0);
set(handles.radiobutton_2d_circular,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton_circular



function edit_radius_Callback(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_radius as text
%        str2double(get(hObject,'String')) returns contents of edit_radius as a double


% --- Executes during object creation, after setting all properties.
function edit_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p_x as text
%        str2double(get(hObject,'String')) returns contents of edit_p_x as a double


% --- Executes during object creation, after setting all properties.
function edit_p_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p_y as text
%        str2double(get(hObject,'String')) returns contents of edit_p_y as a double


% --- Executes during object creation, after setting all properties.
function edit_p_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p_z as text
%        str2double(get(hObject,'String')) returns contents of edit_p_z as a double


% --- Executes during object creation, after setting all properties.
function edit_p_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Model = 'Dynamic';
if evalin('base', 'DynamicLoaded') == 0
load_system(Model);
disp('loaded')
set_param(Model,'StopTime','inf');
set_param(Model,'SimulationMode','normal');
set_param(Model,'SimulationCommand','start');
assignin('base','DynamicLoaded',1);
set(handles.pushbutton_reset,'string','System loaded');
set(handles.pushbutton_reset,'backgroundcolor',[0 1 0]);
else
    set_param(Model,'SimulationCommand','stop');
close_system(Model); 
disp('loaded')
assignin('base','DynamicLoaded',0);
set(handles.pushbutton_reset,'string','Load system');
set(handles.pushbutton_reset,'backgroundcolor',[0.94 0.94 0.94]);
end
% plot_robot(handles);


% --- Executes on button press in radiobutton_2d_circular.
function radiobutton_2d_circular_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_2d_circular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton_circular,'value',0);
set(handles.radiobutton_linear,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton_2d_circular



function edit67_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p3_z as text
%        str2double(get(hObject,'String')) returns contents of edit_p3_z as a double


% --- Executes during object creation, after setting all properties.
function edit67_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p3_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_trajectory_tab1.
function pushbutton_trajectory_tab1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_trajectory_tab1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_trajectory_tab1,'visible','on','position',[124.1429 19.0588 62 30]);
set(handles.uipanel_trajectory_tab2,'visible','off','position',[124.1429 19.0588 134 30]);
set(handles.uipanel_trajectory_tab3,'visible','off','position',[124.1429 19.0588 20 20 ]);
set(handles.pushbutton_trajectory_tab1,'BackgroundColor','green','fontweight','bold','fontsize',10);
set(handles.pushbutton_trajectory_tab2,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);
set(handles.pushbutton_trajectory_tab3,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);
% --- Executes on button press in pushbutton_trajectory_tab2.
function pushbutton_trajectory_tab2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_trajectory_tab2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_trajectory_tab2,'visible','on','position',[124.1429 19.0588 134 30]);
set(handles.uipanel_trajectory_tab1,'visible','off','position',[124.1429 19.0588 134 30]);
set(handles.uipanel_trajectory_tab3,'visible','off','position',[124.1429 19.0588 20 20]);
set(handles.pushbutton_trajectory_tab2,'BackgroundColor','green','fontweight','bold','fontsize',10);
set(handles.pushbutton_trajectory_tab1,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);
set(handles.pushbutton_trajectory_tab3,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);

% --- Executes on button press in pushbutton_trajectory_tab3.
function pushbutton_trajectory_tab3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_trajectory_tab3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_trajectory_tab3,'visible','on','position',[124.1429 19.0588 134 30 ]);
set(handles.uipanel_trajectory_tab2,'visible','off','position',[124.1429 19.0588 134 30 ]);
set(handles.uipanel_trajectory_tab1,'visible','off','position',[124.1429 19.0588 20 20]);
set(handles.pushbutton_trajectory_tab3,'BackgroundColor','green','fontweight','bold','fontsize',10);
set(handles.pushbutton_trajectory_tab1,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);
set(handles.pushbutton_trajectory_tab2,'BackgroundColor',[0.94 0.94 0.94],'fontweight','normal','fontsize',8);



function edit_det_J_Callback(hObject, eventdata, handles)
% hObject    handle to edit_det_J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_det_J as text
%        str2double(get(hObject,'String')) returns contents of edit_det_J as a double


% --- Executes during object creation, after setting all properties.
function edit_det_J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_det_J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
