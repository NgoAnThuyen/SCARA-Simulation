function  [q_max,start_p, stop_p ,R, I ]= PathPlanning3(handles)
%%
%Linear interpolation
%%
% Old value
p_x_old = str2num(get(handles.edit_p4_x,'String'));
p_y_old = str2num(get(handles.edit_p4_y,'String'));
p_z_old = str2num(get(handles.edit_p4_z,'String'));
yaw_old = str2num(get(handles.edit_p4_yaw,'String'))*pi/180;

% desired value
p_x = str2num(get(handles.edit_p_x,'String'));
p_y = str2num(get(handles.edit_p_y,'String'));
p_z = str2num(get(handles.edit_p_z,'String'));
yaw = str2num(get(handles.edit_yaw,'String'))*pi/180;
%%
% cal distance
q_max = ((p_x - p_x_old)^2+(p_y - p_y_old)^2+(p_z - p_z_old)^2)^(1/2);
% cal 3d vector parameters
%%
%%
p1 = [p_x_old ; p_y_old ; p_z_old];
p2 = [p_x     ; p_y     ; p_z];
%% 
% Trung diem AB
I = (p1+p2)/2;
plot3(I(1),I(2),I(3),'gx','linewidth',5)
% Ban kinh R 
R = sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2)/2;
start_p = atan2(p1(2)-I(2),p1(1)-I(1))
stop_p  = atan2(p2(2)-I(2),p2(1)-I(1));
stop_p  = +mod(stop_p - start_p,2*pi)  + start_p
theta =linspace(start_p,stop_p ,50);
x = I(1) + R*cos(theta);
y = I(2) + R*sin(theta);
z = I(3) + R*sin(theta)*0;
C_p = [x;y;z];
plot3(handles.axes1,C_p(1,:),C_p(2,:),C_p(3,:),'go')
end