function picker(handles,x,y,z,yaw,w,h)

plot3(handles.axes1,[x-w/2*cos(yaw), x+w/2*cos(yaw)],[y-w/2*sin(yaw), y+w/2*sin(yaw)],[z, z],'linewidth',3,'color','blue');
plot3(handles.axes1,[x-w/2*cos(yaw), x-w/2*cos(yaw)],[y-w/2*sin(yaw), y-w/2*sin(yaw)],[z, z-h],'linewidth',3,'color','blue');
plot3(handles.axes1,[x+w/2*cos(yaw), x+w/2*cos(yaw)],[y+w/2*sin(yaw), y+w/2*sin(yaw)],[z, z-h],'linewidth',3,'color','blue');
end