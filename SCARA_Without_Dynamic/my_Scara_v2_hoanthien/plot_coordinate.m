function plot_coordinate(handles,x,y,z,x_dir,y_dir,z_dir,num)
% x,y,z: toa do bat dau cua he toa do
% x_dir, y_dir, z_dir: huong cua truc toa do tuong ung
% num: so thu tu cua he truc toa do
% vidu: 
% plot_coordinate(p0(1),p0(2),p0(3),1,1,1,0);
hold on
line(handles.axes1,[x x+0.05*3*x_dir],[y y],[z z],'linewidth',1.5,'color', 'red')
text(handles.axes1,x+0.05*3*x_dir,y,z,(['x',num2str(num)]))

line(handles.axes1,[x x],[y y+0.05*3*y_dir],[z z],'linewidth',1.5,'color', 'green')
text(handles.axes1,x,y+0.05*3*y_dir,z,(['y',num2str(num)]))

line(handles.axes1,[x x],[y y],[z z+0.05*3*z_dir/2],'linewidth',1.5,'color', 'blue')
text(handles.axes1,x,y,z+0.05*3*z_dir/2,(['z',num2str(num)]))

end