function pick_arm(handles)
x = str2num(get(handles.edit_p4_x,'String'));
y = str2num(get(handles.edit_p4_y,'String'));
z = str2num(get(handles.edit_p4_z,'String'));
W = 0.05;
H = 0.1;
L = 0.1;
yaw = str2num(get(handles.edit_p4_yaw,'String'))*pi/180;
opa = str2num(get(handles.edit_opacity,'String'));
%%
x1 = [x - (L/2*cos(yaw) - W/2*sin(yaw)), x - (L/2*cos(yaw) + W/2*sin(yaw))  , x + L/2*cos(yaw) - W/2*sin(yaw) , x + L/2*cos(yaw) + W/2*sin(yaw) ];
y1 = [y + (L/2*sin(yaw) + W/2*cos(yaw))  , y + (L/2*sin(yaw) - W/2*cos(yaw))    , y - (L/2*sin(yaw) + W/2*cos(yaw)), y - (L/2*sin(yaw) - W/2*cos(yaw))];
z1 = [z, z, z, z];

fill3(handles.axes1,x1,y1,z1,[84, 127, 112]/255,'FaceAlpha',opa);
%%

x2 = [x - (L/4*cos(yaw) - W/2*sin(yaw))  , x - (L/4*cos(yaw) + W/2*sin(yaw))    , x + L/4*cos(yaw) - W/2*sin(yaw) , x + L/4*cos(yaw) + W/2*sin(yaw) ];
y2 = [y + (L/4*sin(yaw) + W/2*cos(yaw))  , y + (L/4*sin(yaw) - W/2*cos(yaw))    , y - (L/4*sin(yaw) + W/2*cos(yaw)), y - (L/4*sin(yaw) - W/2*cos(yaw))];
z2 = [z-H/4, z-H/4, z-H/4, z-H/4];

fill3(handles.axes1,x2,y2,z2,[84, 127, 112]/255,'FaceAlpha',opa);
%%

%%
x3 =[x - (L/2*cos(yaw) - W/2*sin(yaw)), x  - (L/4*cos(yaw) - W/2*sin(yaw)), x - (L/4*cos(yaw) - W/2*sin(yaw))  ,  x + L/4*cos(yaw) + W/2*sin(yaw)  ,  x + L/4*cos(yaw) + W/2*sin(yaw)  ,  x + L/2*cos(yaw) + W/2*sin(yaw)];
y3 =[y + (L/2*sin(yaw) + W/2*cos(yaw)), y  + (L/4*sin(yaw) + W/2*cos(yaw)), y + (L/4*sin(yaw) + W/2*cos(yaw))  ,  y - (L/4*sin(yaw) - W/2*cos(yaw)),  y - (L/4*sin(yaw) - W/2*cos(yaw)),   y - (L/2*sin(yaw) - W/2*cos(yaw))];
z3 =[z, z-H,z-H/4,z-H/4,z-H, z];

fill3(handles.axes1,x3,y3,z3,[84, 127, 112]/255,'FaceAlpha',opa);
%%
x4 =[x + (L/2*cos(yaw) - W/2*sin(yaw)), x  + (L/4*cos(yaw) - W/2*sin(yaw)), x + (L/4*cos(yaw) - W/2*sin(yaw))  ,  x - ( L/4*cos(yaw) + W/2*sin(yaw) ) ,  x - (L/4*cos(yaw) + W/2*sin(yaw))  ,  x - ( L/2*cos(yaw) + W/2*sin(yaw))];
y4 =[y - (L/2*sin(yaw) + W/2*cos(yaw)), y  - (L/4*sin(yaw) + W/2*cos(yaw)), y - (L/4*sin(yaw) + W/2*cos(yaw))  ,  y + (L/4*sin(yaw) - W/2*cos(yaw)),  y + (L/4*sin(yaw) - W/2*cos(yaw)),   y + (L/2*sin(yaw) - W/2*cos(yaw))];
z4 =[z, z-H,z-H/4,z-H/4,z-H, z];

fill3(handles.axes1,x4,y4,z4,[84, 127, 112]/255,'FaceAlpha',opa);

%%
x5 =[x + (L/2*cos(yaw) - W/2*sin(yaw)), x  + (L/4*cos(yaw) - W/2*sin(yaw)), x + L/4*cos(yaw) + W/2*sin(yaw)  ,  x + L/2*cos(yaw) + W/2*sin(yaw) ];
y5 =[y - (L/2*sin(yaw) + W/2*cos(yaw)), y  - (L/4*sin(yaw) + W/2*cos(yaw)), y - (L/4*sin(yaw) - W/2*cos(yaw)),   y - (L/2*sin(yaw) - W/2*cos(yaw))];
z5 =[z,z-H,z-H,z];

fill3(handles.axes1,x5,y5,z5,[84, 127, 112]/255,'FaceAlpha',opa);
%%
x6 =[x - (L/2*cos(yaw) - W/2*sin(yaw)), x  - (L/4*cos(yaw) - W/2*sin(yaw)), x - (L/4*cos(yaw) + W/2*sin(yaw))  ,  x - (L/2*cos(yaw) + W/2*sin(yaw)) ];
y6 =[y + (L/2*sin(yaw) + W/2*cos(yaw)), y  + (L/4*sin(yaw) + W/2*cos(yaw)), y + (L/4*sin(yaw) - W/2*cos(yaw)),   y + (L/2*sin(yaw) - W/2*cos(yaw))];
z6 =[z,z-H,z-H,z];

fill3(handles.axes1,x6,y6,z6,[84, 127, 112]/255,'FaceAlpha',opa);
%%
x7 =[ x  - (L/4*cos(yaw) - W/2*sin(yaw)), x - (L/4*cos(yaw) + W/2*sin(yaw)),  x - (L/4*cos(yaw) + W/2*sin(yaw)), x - (L/4*cos(yaw) - W/2*sin(yaw))  ];
y7 =[ y  + (L/4*sin(yaw) + W/2*cos(yaw)), y + (L/4*sin(yaw) - W/2*cos(yaw)),  y + (L/4*sin(yaw) - W/2*cos(yaw)), y + (L/4*sin(yaw) + W/2*cos(yaw))];
z7 =[z-H,z-H,z-H/4,z-H/4];

fill3(handles.axes1,x7,y7,z7,[84, 127, 112]/255,'FaceAlpha',opa);
%%
x7 =[ x  - (L/4*cos(yaw) - W/2*sin(yaw)), x - (L/4*cos(yaw) + W/2*sin(yaw)),  x - (L/4*cos(yaw) + W/2*sin(yaw)), x - (L/4*cos(yaw) - W/2*sin(yaw))  ];
y7 =[ y  + (L/4*sin(yaw) + W/2*cos(yaw)), y + (L/4*sin(yaw) - W/2*cos(yaw)),  y + (L/4*sin(yaw) - W/2*cos(yaw)), y + (L/4*sin(yaw) + W/2*cos(yaw))];
z7 =[z-H,z-H,z-H/4,z-H/4];

fill3(handles.axes1,x7,y7,z7,[84, 127, 112]/255,'FaceAlpha',opa);
end
