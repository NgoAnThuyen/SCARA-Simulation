function plot_robot_animation(handles,d3,theta1,theta2,theta4)
%% DH Table
% syms a1 a2 d3 d4 theta1 theta2 theta4
% a     = [a1    ; a2     ;  0  ; 0     ];
% alpha = [0     ; pi     ;  0  ; 0     ];
% d     = [0     ; 0      ;  d3 ; d4    ];
% theta = [theta1; theta2 ;  0  ; theta4];
%% Update POSE
% Get parameters from GUI
a1     = str2num(get(handles.edit_a1,'String'));
a2     = str2num(get(handles.edit_a2,'String'));
d4     = str2num(get(handles.edit_d4,'String'));
%%  Init DH Table
a     = [a1    ; a2     ;  0  ; 0     ];
alpha = [0     ; pi     ;  0  ; 0     ];
d     = [0     ; 0      ;  d3 ; d4    ];
theta = [theta1; theta2 ;  0  ; theta4];

%% FK Matrix
A0_1 = Link_matrix(a(1),alpha(1),d(1),theta(1)) ;
A1_2 = Link_matrix(a(2),alpha(2),d(2),theta(2)) ;
A2_3 = Link_matrix(a(3),alpha(3),d(3),theta(3)) ;
A3_4 = Link_matrix(a(4),alpha(4),d(4),theta(4)) ;

A0_2=A0_1*A1_2;
A0_3=A0_1*A1_2*A2_3;
A0_4=A0_1*A1_2*A2_3*A3_4;   % Te



%Update




% A0_1=eval(A0_1);
% A0_2=eval(A0_2);
% A0_3=eval(A0_3);
% A0_4=eval(A0_4);

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
hold on
grid on

Con =[p0,p1,p2,p3,p4];
% plot coordinate
if handles.checkbox_c0.Value
    plot_coordinate(p0(1),p0(2),p0(3),1,1,1,0);
end
if handles.checkbox_c1.Value
    plot_coordinate(p1(1),p1(2),p1(3),1,1,1,1);
end
if handles.checkbox_c2.Value
    plot_coordinate(p2(1),p2(2),p2(3),1,-1,-1,2);
end
if handles.checkbox_c3.Value
    plot_coordinate(p3(1),p3(2),p3(3),1,-1,-1,3);
end
if handles.checkbox_c4.Value
    plot_coordinate(p4(1),p4(2),p4(3),1,-1,-1,4);
end
%


% define links
line1=[[p0(1) p1(1)];[p0(2) p1(2)];[p0(3) p1(3)]];
line2=[[p1(1) p2(1)];[p1(2) p2(2)];[p1(3) p2(3)]];
line3=[[p2(1) p3(1)];[p2(2) p3(2)];[p2(3) p3(3)]];
line4=[[p3(1) p4(1)];[p3(2) p4(2)];[p3(3) p4(3)]];


xlabel(handles.axes1,'x');
ylabel(handles.axes1,'y');
zlabel(handles.axes1,'z');
xlim(handles.axes1,[-1 1]);
ylim(handles.axes1,[-1 1]);
zlim(handles.axes1,[-0.6 1]);

%base
% t = (1/16:1/8:1)'*2*pi;
% x = cos(t);
% y = sin(t);
% z = [-0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5]';
% fill3(handles.axes1,x,y,z,'g','FaceAlpha',0.25)
% base_plot=plot3(handles.axes1,[0 0],[ 0 0 ],[0 -0.5],'linewidth',15,'color', 'black');
% base_plot.Color(4)=1;
% plot3(handles.axes1,0,0,-0.5,'rx','linewidth',5)
plot_base(handles)
%link1
plot_Link1(handles,theta1)
% line1_plot=plot3(handles.axes1,line1(1,:),line1(2,:),line1(3,:),'linewidth',8,'color', 'blue');
% line1_plot.Color(4)=0.5;
%link2
plot_Link2(handles,theta2)
% line2_plot=plot3(handles.axes1,line2(1,:),line2(2,:),line2(3,:),'linewidth',7,'color', 'green');
% line2_plot.Color(4)=0.5;
%link3
plot_Link3(handles,d3)
% line3_plot=plot3(handles.axes1,line3(1,:),line3(2,:),line3(3,:),'linewidth',6,'color', 'cyan');
% line3_plot.Color(4)=0.5;
%link4
plot_Link4(handles,d3,d4)
% line4_plot=plot3(handles.axes1,line4(1,:),line4(2,:),line4(3,:),'linewidth',5,'color', 'yellow');
% line4_plot.Color(4)=0.5;
% plot3(handles.axes1,Con(1,:),Con(2,:),Con(3,:),'rx','linewidth',5)

%picker arm
pick_arm(handles);
%picker(p4(1),p4(2),p4(3),-str2num(get(handles.edit_p4_yaw,'String'))*pi/180,0.25,0.1);
rotate3d on
az = str2num(get(handles.edit_AZ,'String'));
ei = str2num(get(handles.edit_EI,'String'));
view(az,ei);
end