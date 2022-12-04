function plot_trajectory(handles,option)
persistent init 
persistent x y z
if ~init,
    init = 1;
    x = [];
    y = [];
    z = [];
 
end


%%
x_next = str2num(get(handles.edit_p4_x,'string'));
y_next = str2num(get(handles.edit_p4_y,'string'));
z_next = str2num(get(handles.edit_p4_z,'string'));

x = [x , x_next ];
y = [y , y_next ];
z = [z , z_next ];
plot3(handles.axes1,x,y,z,'b','linewidth',2);

if option == 1,  % clear trajectory
    init = 0;
elseif option == 2 , % plot x y z
    figure 
    subplot(2,2,1)
    grid on
    hold on
    title('XY [m]');
    plot(x,y);
    xlabel('x');
    ylabel('y');
    

    subplot(2,2,2)
    grid on
    hold on
    title('YZ [m]');
    plot(y,z);
    xlabel('y');
    ylabel('z');
    
        

    subplot(2,2,3)
    grid on
    hold on
    title('ZX [m]');
    plot(z,x);
    xlabel('z');
    ylabel('x');
    
        

    subplot(2,2,4)
    grid on
    hold on
    title('XYZ [m]');
    plot3(x,y,z);
    view()
    xlabel('x');
    ylabel('y');
    zlabel('z');
  rotate3d on
az = str2num(get(handles.edit_AZ,'String'));
ei = str2num(get(handles.edit_EI,'String'));
view(az,ei);
end

end
