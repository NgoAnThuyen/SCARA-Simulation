function plot_Link3(handles,d3)

%%
x = str2num(get(handles.edit_p2_x,'String'));
y = str2num(get(handles.edit_p2_y,'String'));
r = 0.025;
H = 0.33+0.22;

opa = str2num(get(handles.edit_opacity,'String'));
th=0:pi/100:2*pi;
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*-d3; ones(1,size(th,2))*(2*H-d3)], 'FaceColor',[102, 153, 153]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a+x , b+y , -d3*ones(1,size(th,2)) ,[102, 153, 153]/255,'FaceAlpha',opa);
fill3(handles.axes1,a+x , b+y , (2*H-d3)*ones(1,size(th,2)) ,[102, 153, 153]/255,'FaceAlpha',opa);
%% Ve dinh cua truc
r = 0.055;
hgt = 0.025;
th=0:pi/100:2*pi;
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*(2*H-d3+hgt); ones(1,size(th,2))*(2*H-d3)],'FaceColor',[164, 71, 42]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a + x , b + y , (2*H-d3+hgt)*ones(1,size(th,2)),[164, 71, 42]/255,'FaceAlpha',opa);
fill3(handles.axes1,a + x , b + y, (2*H-d3)*ones(1,size(th,2)),[164, 71, 42]/255,'FaceAlpha',opa);
%% ve duong xoan oc
n = 8;    % so vong xoan
th = linspace(0,2*pi*n,1000);
r  = 0.025;
a  = r*cos(th);
b  = r*sin(th);
c  = linspace(-d3,2*H-d3,1000);
plot3(handles.axes1,a+x,b+y,c,'color',[253, 255, 245]/255,'linewidth',2);