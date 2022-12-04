function plot_Link2(handles, yaw_d)

x = str2num(get(handles.edit_p1_x,'String'));
y = str2num(get(handles.edit_p1_y,'String'));
L = str2num(get(handles.edit_a2,'String'));
W = 0.2;
H_pre = 0.05;
H = 0.3;
opa = str2num(get(handles.edit_opacity,'String'));
%Yaw = yaw_d-pi/2;
Yaw = -str2num(get(handles.edit_p2_yaw,'String'))*pi/180 - pi/2;

%%
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[0+H_pre, 0+H_pre, 0+H_pre, 0+H_pre ],[15, 119, 171]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[H, H, H, H ],[15, 119, 171]/255,'FaceAlpha',opa)


fill3(handles.axes1,[x+W/2*cos(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)],[y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+W/2*sin(Yaw)],[0+H_pre, 0+H_pre, H, H ],[15, 119, 171]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x-W/2*cos(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y-W/2*sin(Yaw)],[0+H_pre, 0+H_pre, H, H ],[15, 119, 171]/255,'FaceAlpha',opa)

%%
x = str2num(get(handles.edit_p1_x,'String'));
y = str2num(get(handles.edit_p1_y,'String'));
r = W/2;
hgt = H;
th=(pi+Yaw):pi/100:(2*pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*H_pre; ones(1,size(th,2))*-(0-hgt)],'FaceColor',[15, 119, 171]/255, 'EdgeColor','none','FaceAlpha',opa,'edgecolor','none')
fill3(handles.axes1,a + x , b + y, H_pre*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[15, 119, 171]/255,'FaceAlpha',opa);
fill3(handles.axes1,a + x , b + y , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[15, 119, 171]/255,'FaceAlpha',opa);

%%
x = str2num(get(handles.edit_p2_x,'String'));
y = str2num(get(handles.edit_p2_y,'String'));
r = W/2;
hgt = H;
th=(0+Yaw):pi/100:(pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*(H_pre); ones(1,size(th,2))*-(0-hgt)],'FaceColor',[15, 119, 171]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a+x , b+y , H_pre*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[15, 119, 171]/255,'FaceAlpha',opa);
fill3(handles.axes1,a+x , b+y , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[15, 119, 171]/255,'FaceAlpha',opa);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Phan nay chi la trang tri
x = str2num(get(handles.edit_p1_x,'String'));
y = str2num(get(handles.edit_p1_y,'String'));
L = str2num(get(handles.edit_a2,'String'));
W = 0.2;
H_pre = 0.05;
H = 3*H_pre;
opa = str2num(get(handles.edit_opacity,'String'));
%Yaw = yaw_d-pi/2;
Yaw = -str2num(get(handles.edit_p2_yaw,'String'))*pi/180 - pi/2;

%%
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[0+H_pre, 0+H_pre, 0+H_pre, 0+H_pre ],[15, 119, 171]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[H, H, H, H ],[87, 109, 129]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x+W/2*cos(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)],[y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+W/2*sin(Yaw)],[0+H_pre, 0+H_pre, H, H ],[87, 109, 129]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x-W/2*cos(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y-W/2*sin(Yaw)],[0+H_pre, 0+H_pre, H, H ],[87, 109, 129]/255,'FaceAlpha',opa)

%%
x = str2num(get(handles.edit_p1_x,'String'));
y = str2num(get(handles.edit_p1_y,'String'));
r = W/2;
hgt = H;
th=(pi+Yaw):pi/100:(2*pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*H_pre; ones(1,size(th,2))*-(0-hgt)],'FaceColor',[87, 109, 129]/255, 'EdgeColor','none','FaceAlpha',opa,'edgecolor','none')
fill3(handles.axes1,a + x , b + y, H_pre*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[87, 109, 129]/255,'FaceAlpha',opa);
fill3(handles.axes1,a + x , b + y , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[87, 109, 129]/255,'FaceAlpha',opa);

%%
x = str2num(get(handles.edit_p2_x,'String'));
y = str2num(get(handles.edit_p2_y,'String'));
r = W/2;
hgt = H;
th=(0+Yaw):pi/100:(pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*(H_pre); ones(1,size(th,2))*-(0-hgt)],'FaceColor',[87, 109, 129]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a+x , b+y , H_pre*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[87, 109, 129]/255,'FaceAlpha',opa);
fill3(handles.axes1,a+x , b+y , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[87, 109, 129]/255,'FaceAlpha',opa);


end