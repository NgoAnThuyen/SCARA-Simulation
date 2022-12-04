function plot_base(handles)

%%
x = 0;
y = 0;
r = 0.15;
hgt = - 0.5;

opa = str2num(get(handles.edit_opacity,'String'));
th=0:pi/100:2*pi;
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2)); zeros(1,size(th,2))]*hgt(1), 'FaceColor',[87, 109, 129]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a , b , 0*ones(1,size(th,2)) ,[87, 109, 129]/255,'FaceAlpha',opa);
fill3(handles.axes1,a , b , hgt*ones(1,size(th,2)) ,[87, 109, 129]/255,'FaceAlpha',opa);

%%

x = 0;
y = 0;
r = 0.5;
hgt = - 0.05;
th=0:pi/100:2*pi;
a=r*cos(th);
b=r*sin(th);

surf(handles.axes1,[a; a]+x(1), [b; b]+y(1), [ones(1,size(th,2))*-0.5; ones(1,size(th,2))*-(0.5-hgt)],'FaceColor',[164, 71, 42]/255, 'EdgeColor','none','FaceAlpha',opa)
fill3(handles.axes1,a , b , 0*ones(1,size(th,2))-0.5*ones(1,size(th,2)) ,[164, 71, 42]/255,'FaceAlpha',opa);
fill3(handles.axes1,a , b , hgt*ones(1,size(th,2))-0.5*ones(1,size(th,2)),[164, 71, 42]/255,'FaceAlpha',opa);

