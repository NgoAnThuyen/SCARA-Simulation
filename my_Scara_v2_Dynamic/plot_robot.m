function plot_robot(handles)
if evalin('base', 'DynamicLoaded') == 1
%% DH Table
% syms a1 a2 d3 d4 theta1 theta2 theta4
% a     = [a1    ; a2     ;  0  ; 0     ];
% alpha = [0     ; pi     ;  0  ; 0     ];
% d     = [0     ; 0      ;  d3 ; d4    ];
% theta = [theta1; theta2 ;  0  ; theta4];
%% Update POSE
theta1_rto  = get_param('Dynamic/theta1','RuntimeObject');
theta1      = theta1_rto.OutputPort(1).Data(1);
theta2_rto  = get_param('Dynamic/theta2','RuntimeObject');
theta2      = theta2_rto.OutputPort(1).Data(1);
d3_rto      = get_param('Dynamic/d3','RuntimeObject');
d3          = d3_rto.OutputPort(1).Data(1);
theta4_rto  = get_param('Dynamic/theta4','RuntimeObject');
theta4      = theta4_rto.OutputPort(1).Data(1);

old_data = evalin('base', 'old_data');
if (round(theta1,4) ~= round(old_data(1),4))||(round(theta2,4) ~= round(old_data(2),4))||(round(d3,4) ~= round(old_data(3),4))||(round(theta4,4) ~= round(old_data(4),4)),
disp('plot robot')
set(handles.edit_d3,'String',num2str(d3));
set(handles.slider_d3,'Value',d3);
set(handles.edit_theta1,'String',num2str(round(theta1*180/pi,4)));
set(handles.slider_theta1,'Value',abs(theta1)*180/pi);
set(handles.edit_theta2,'String',num2str(round(theta2*180/pi,4)));
set(handles.slider_theta2,'Value',abs(theta2)*180/pi);
set(handles.edit_theta4,'String',num2str(round(theta4*180/pi,4)));
set(handles.slider_theta4,'Value',abs(theta4)*180/pi);


old_data = zeros(4,1);
old_data(1) = theta1;  
old_data(2) = theta2;  
old_data(3) = d3;  
old_data(4) = theta4;  
assignin('base','old_data',old_data);
% Get parameters from GUI
a1     = str2num(get(handles.edit_a1,'String'));
a2     = str2num(get(handles.edit_a2,'String'));

d4     = str2num(get(handles.edit_d4,'String'));

d3     = str2num(get(handles.edit_d3,'String'));
theta1 = str2num(get(handles.edit_theta1,'String'))*pi/180;
theta2 = str2num(get(handles.edit_theta2,'String'))*pi/180;
theta4 = str2num(get(handles.edit_theta4,'String'))*pi/180;

%%  Init DH Table
a     = [a1    ; a2     ;  0  ;   0     ];
alpha = [0     ; pi     ;  0  ;   0     ];
d     = [0     ; 0      ;  d3 ;   d4    ];
theta = [theta1; theta2 ;  0  ;   theta4];

%% FK Matrix
A0_1 = Link_matrix(a(1),alpha(1),d(1),theta(1)) ;
A1_2 = Link_matrix(a(2),alpha(2),d(2),theta(2)) ;
A2_3 = Link_matrix(a(3),alpha(3),d(3),theta(3)) ;
A3_4 = Link_matrix(a(4),alpha(4),d(4),theta(4)) ;

A0_2=A0_1*A1_2;
A0_3=A0_1*A1_2*A2_3;
A0_4=A0_1*A1_2*A2_3*A3_4;   % Te

p0 = [0;0;0];
[p1, o1] = cal_pose(A0_1,p0);
[p2, o2] = cal_pose(A0_2,p0);
[p3, o3] = cal_pose(A0_3,p0);
[p4, o4] = cal_pose(A0_4,p0);

set(handles.edit_p1_x,'String',round(p1(1),3));
set(handles.edit_p1_y,'String',round(p1(2),3));
set(handles.edit_p1_z,'String',round(p1(3),3));
set(handles.edit_p1_roll,'String',round(o1(1)*180/pi,3));
set(handles.edit_p1_pitch,'String',round(o1(2)*180/pi,3));
set(handles.edit_p1_yaw,'String',round(o1(3)*180/pi,3));

set(handles.edit_p2_x,'String',round(p2(1),3));
set(handles.edit_p2_y,'String',round(p2(2),3));
set(handles.edit_p2_z,'String',round(p2(3),3));
set(handles.edit_p2_roll,'String',round(o2(1)*180/pi,3));
set(handles.edit_p2_pitch,'String',round(o2(2)*180/pi,3));
set(handles.edit_p2_yaw,'String',round(o2(3)*180/pi,3));

set(handles.edit_p3_x,'String',round(p3(1),3));
set(handles.edit_p3_y,'String',round(p3(2),3));
set(handles.edit_p3_z,'String',round(p3(3),3));
set(handles.edit_p3_roll,'String',round(o3(1)*180/pi,3));
set(handles.edit_p3_pitch,'String',round(o3(2)*180/pi,3));
set(handles.edit_p3_yaw,'String',round(o3(3)*180/pi,3));

set(handles.edit_p4_x,'String',round(p4(1),3));
set(handles.edit_p4_y,'String',round(p4(2),3));
set(handles.edit_p4_z,'String',round(p4(3),3));
set(handles.edit_p4_roll,'String',round(o4(1)*180/pi,3));
set(handles.edit_p4_pitch,'String',round(o4(2)*180/pi,3));
set(handles.edit_p4_yaw,'String',round(o4(3)*180/pi,3));

%% Plot
cla(handles.axes1,'reset')
hold(handles.axes1,'on');
grid(handles.axes1,'on');

Con =[p0,p1,p2,p3,p4];
% plot coordinate
if handles.checkbox_c0.Value
    plot_coordinate(handles,p0(1),p0(2),p0(3),1,1,1,0);
end
if handles.checkbox_c1.Value
    plot_coordinate(handles,p1(1),p1(2),p1(3),1,1,1,1);
end
if handles.checkbox_c2.Value
    plot_coordinate(handles,p2(1),p2(2),p2(3),1,-1,-1,2);
end
if handles.checkbox_c3.Value
    plot_coordinate(handles,p3(1),p3(2),p3(3),1,-1,-1,3);
end
if handles.checkbox_c4.Value
    plot_coordinate(handles,p4(1),p4(2),p4(3),1,-1,-1,4);
end
%
%%

%  set(handles.edit_det_J,'string',num2str(det(Jacobian)));

%%
% define links



xlabel(handles.axes1,'x');
ylabel(handles.axes1,'y');
zlabel(handles.axes1,'z');
xlim(handles.axes1,[-1 1]);
ylim(handles.axes1,[-1 1]);
zlim(handles.axes1,[-0.6 1]);

%base

plot_base(handles)
%link1
plot_Link1(handles,theta1)

%link2
plot_Link2(handles,theta2)

%link3
plot_Link3(handles,d3)

%link5
plot_Link4(handles,d3,d4)
%picker arm
pick_arm(handles);
rotate3d(handles.axes1,'on')
az = str2num(get(handles.edit_AZ,'String'));
ei = str2num(get(handles.edit_EI,'String'));
view(handles.axes1,az,ei);
end
end
end