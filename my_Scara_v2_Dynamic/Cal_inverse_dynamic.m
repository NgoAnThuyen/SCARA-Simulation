function Cal_inverse_dynamic(handles)
%% Get params
d4 = str2num(get(handles.edit_d4,'String'));
a1 = str2num(get(handles.edit_a1,'String'));
a2 = str2num(get(handles.edit_a2,'String'));
p_x = str2num(get(handles.edit_p4_x,'String'));
p_y = str2num(get(handles.edit_p4_y,'String'));
p_z = str2num(get(handles.edit_p4_z,'String'));
yaw = str2num(get(handles.edit_p4_yaw,'String'))*pi/180;
%% Save old DH Variables:
[d3_old, theta1_old, theta2_old, theta4_old]=get_params(handles);
%% check the condition : 
if (p_x^2 +p_y^2 > a1 + a2 )||(p_z > -d4)||(p_z < -0.38)
    condition = 0;
    f = msgbox('this position is out of range ');
else
    condition = 1;
    
end
if condition,  
%% Calculate
d3_new = - d4 - p_z;
theta2_new = acos((p_x^2 +p_y^2 -a1^2 -a2^2)/(2*a1*a2));
theta1_new = atan2(p_y,p_x) -asin(a2*sin(theta2_new)/sqrt(p_x^2+p_y^2));
theta4_new = theta1_new + theta2_new - yaw;
%% Update values to plot
set(handles.edit_d3,'String',num2str(d3_new));
set(handles.edit_theta1,'String',num2str(round(theta1_new*180/pi,4)));
set(handles.edit_theta2,'String',num2str(round(theta2_new*180/pi,4)));
set(handles.edit_theta4,'String',num2str(round(theta4_new*180/pi,4)));

% speed = str2num(get(handles.edit_speed,'String'));
% d3 = linspace(d3_old, d3_new, 100/speed);
% theta1 = linspace(theta1_old, theta1_new, 100/speed);
% theta2 = linspace(theta2_old, theta2_new, 100/speed);
% theta4 = linspace(theta4_old, theta4_new, 100/speed);
% %% Plot animation
% % get speed
% 
% % plot
% for i = 1: 100/speed
% plot_robot_animation(handles,d3(i),theta1(i),theta2(i),theta4(i));
% percent = round( 100*i/(100/speed),0);
% set(handles.edit_process,'String', ([num2str(percent),'%']));
% plot_trajectory(handles,0);
% pause(0.01);
% end
% f = msgbox('Plot Animation done ');
% set(handles.text_process,'visible','off');
% set(handles.edit_process,'visible','off');
% end
% set(handles.text_process,'visible','off');
% set(handles.edit_process,'visible','off');
end