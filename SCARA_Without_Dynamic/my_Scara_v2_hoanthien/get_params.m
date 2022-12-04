function [d3, theta1, theta2, theta4]=get_params(handles)
d3     = str2num(get(handles.edit_d3,'String'));
theta1 = str2num(get(handles.edit_theta1,'String'))*pi/180;
theta2 = str2num(get(handles.edit_theta2,'String'))*pi/180;
theta4 = str2num(get(handles.edit_theta4,'String'))*pi/180;
end
