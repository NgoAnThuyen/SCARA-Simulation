function  [break_signal,req, res]= Calc_Inverse_Dynamic(handles,p_x,p_y,p_z,yaw)
d4 = str2num(get(handles.edit_d4,'String'));
a1 = str2num(get(handles.edit_a1,'String'));
a2 = str2num(get(handles.edit_a2,'String'));

%% Save old DH Variables:

%% check the condition : 
if (p_x^2 +p_y^2 > a1 + a2 )||(p_z > -d4)||(p_z < -0.38)
    p_x^2 +p_y^2
    condition = 1;
    break_signal = 0;
%     f = msgbox('this position is out of range ');
else
    condition = 1;
    break_signal = 0;
end
if condition,  
%% Calculate desired value
d3_new = - d4 - p_z;
theta2_new = acos((p_x^2 +p_y^2 -a1^2 -a2^2)/(2*a1*a2));
theta1_new = atan2(p_y,p_x) - asin(a2*sin(theta2_new)/sqrt(p_x^2+p_y^2));
theta4_new = theta1_new + theta2_new - yaw;
req = [theta1_new; theta2_new;d3_new; theta4_new];

%% Export data to SIMULINK
set_param('Dynamic/theta1_d','value',num2str(theta1_new));
set_param('Dynamic/theta2_d','value',num2str(theta2_new));
set_param('Dynamic/theta4_d','value',num2str(theta4_new));
set_param('Dynamic/d3_d','value',num2str(d3_new));
%% Update values to plot

theta1_rto = get_param('Dynamic/theta1','RuntimeObject');
theta1 = theta1_rto.OutputPort(1).Data(1);
theta2_rto = get_param('Dynamic/theta2','RuntimeObject');
theta2 = theta2_rto.OutputPort(1).Data(1);
d3_rto = get_param('Dynamic/d3','RuntimeObject');
d3 = d3_rto.OutputPort(1).Data(1);
theta4_rto = get_param('Dynamic/theta4','RuntimeObject');
theta4 = theta4_rto.OutputPort(1).Data(1);


res = [theta1; theta2;d3; theta4];

set(handles.edit_d3,'String',num2str(d3));
set(handles.slider_d3,'Value',d3);
set(handles.edit_theta1,'String',num2str(round(theta1*180/pi,4)));
set(handles.slider_theta1,'Value',abs(theta1)*180/pi);
set(handles.edit_theta2,'String',num2str(round(theta2*180/pi,4)));
set(handles.slider_theta2,'Value',abs(theta2)*180/pi);
set(handles.edit_theta4,'String',num2str(round(theta4*180/pi,4)));
set(handles.slider_theta4,'Value',abs(theta4)*180/pi);

end