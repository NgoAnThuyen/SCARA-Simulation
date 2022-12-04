function plot_Link4(handles,d3, d4)

%%
x = str2num(get(handles.edit_p3_x,'String'));
y = str2num(get(handles.edit_p3_y,'String'));
opa = str2num(get(handles.edit_opacity,'String'));
r = 0.02;
H = 0.33;


th=0:pi/100:2*pi;
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*-d3; ones(1,size(th,2))*(-d4-d3)], 'FaceColor',[252, 25, 140]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a+x , b+y , -d3*ones(1,size(th,2)) ,[252, 25, 140]/255,'FaceAlpha',opa);
fill3(handles.axes1,a+x , b+y , (-d4-d3)*ones(1,size(th,2)) ,[252, 25, 140]/255,'FaceAlpha',opa);