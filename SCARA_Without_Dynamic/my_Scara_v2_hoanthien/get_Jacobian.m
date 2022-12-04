function Jacobian = get_Jacobian(handles)
a1     = str2num(get(handles.edit_a1,'String'));
a2     = str2num(get(handles.edit_a2,'String'));
d3     = str2num(get(handles.edit_d3,'String'));
d4     = str2num(get(handles.edit_d4,'String'));
theta1 = str2num(get(handles.edit_theta1,'String'))*pi/180;
theta2 = str2num(get(handles.edit_theta2,'String'))*pi/180;
theta4 = str2num(get(handles.edit_theta4,'String'))*pi/180;

Jacobian =  [-a1*sin(theta1)-a2*sin(theta1)*sin(theta2), -a2*sin(theta1)*sin(theta2),0,0;
              a1*cos(theta1)+a2*cos(theta1)*sin(theta2),  a2*cos(theta1)*cos(theta2),0,0;
              0,0,-1,0;
              1,1,0,-1];
end