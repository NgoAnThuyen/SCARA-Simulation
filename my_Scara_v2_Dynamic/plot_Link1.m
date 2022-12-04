function plot_Link1(handles, yaw_d)
x = 0;
y = 0;
L = str2num(get(handles.edit_a1,'String'));
W = 0.2;
H = 0.05;
opa = str2num(get(handles.edit_opacity,'String'));
Yaw = yaw_d-pi/2;

%%
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[0, 0, 0, 0 ],[80, 140, 91]/255,'FaceAlpha',opa)
fill3(handles.axes1,[x-W/2*cos(Yaw),x+W/2*cos(Yaw),x-L*sin(Yaw)+W/2*cos(Yaw),x-L*sin(Yaw)-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw)],[H, H, H, H ],[80, 140, 91]/255,'FaceAlpha',opa)

%fill3([x-W/2,x+W/2,x+W/2,x-W/2],[y, y, y, y],[0, 0, H, H ],[87, 109, 129]/255,'FaceAlpha',1)
% fill3([x-W/2,x+W/2,x+W/2,x-W/2],[y+L, y+L, y+L, y+L],[0, 0, H, H ],[87, 109, 129]/255,'FaceAlpha',1)
% 
 fill3(handles.axes1,[x+W/2*cos(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)-L*sin(Yaw), x+W/2*cos(Yaw)],[y+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+L*cos(Yaw)+W/2*sin(Yaw), y+W/2*sin(Yaw)],[0, 0, H, H ],[80, 140, 91]/255,'FaceAlpha',opa)
 fill3(handles.axes1,[x-W/2*cos(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)-L*sin(Yaw), x-W/2*cos(Yaw)],[y-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y+L*cos(Yaw)-W/2*sin(Yaw), y-W/2*sin(Yaw)],[0, 0, H, H ],[80, 140, 91]/255,'FaceAlpha',opa)
% fill3([x+W/2, x+W/2, x+W/2, x+W/2],[y, y+L, y+L, y],[0, 0, H, H ],[87, 109, 129]/255,'FaceAlpha',1)
%%
x = 0;
y = 0;
r = W/2;
hgt = H;
th=(pi+Yaw):pi/100:(2*pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*0; ones(1,size(th,2))*-(0-hgt)],'FaceColor',[80, 140, 91]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a , b , 0*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[80, 140, 91]/255,'FaceAlpha',opa);
fill3(handles.axes1,a , b , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[80, 140, 91]/255,'FaceAlpha',opa);

%%
x = str2num(get(handles.edit_p1_x,'String'));
y = str2num(get(handles.edit_p1_y,'String'));
r = W/2;
hgt = H;
th=(0+Yaw):pi/100:(pi+Yaw);
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*0; ones(1,size(th,2))*-(0-hgt)],'FaceColor',[80, 140, 91]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a+x , b+y , 0*ones(1,size(th,2))-0*ones(1,size(th,2)) ,[80, 140, 91]/255,'FaceAlpha',opa);
fill3(handles.axes1,a+x , b+y , hgt*ones(1,size(th,2))-0*ones(1,size(th,2)),[80, 140, 91]/255,'FaceAlpha',opa);
end