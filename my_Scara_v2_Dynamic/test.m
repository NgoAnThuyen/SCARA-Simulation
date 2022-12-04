function  pick_arm(handles)
x = str2num(get(handles.edit_p4_x,'String'));
y = str2num(get(handles.edit_p4_y,'String'));
z = str2num(get(handles.edit_p4_z,'String'));

W = 0.05;
H = 0.1;
L = 0.1;

R = [cos(yaw),-sin(yaw),   0;...
     sin(yaw),cos(yaw),    0;...
     0       ,   0        ,1];
hold on
rotate3d on
%%
x1 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y1 = [y-L/2, y-L/2, y+L/2, y+L/2]';
z1 =[z, z, z, z]';
temp1 = R*[x1';y1';z1'];
fill3(temp1(1,:),temp1(2,:),temp1(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x2 = [x+W/2,x+W/2,x+W/2,x+W/2,x+W/2,x+W/2 ]';
y2 = [y-L/2, y+L/2, y+L/4, y+L/4, y-L/4, y-L/4]';
z2 = [z, z, z-H, z-H*0.25, z-H*0.25, z-H ]';
temp2 = R*[x2';y2';z2'];
fill3(temp2(1,:),temp2(2,:),temp2(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x3 = [x-W/2,x-W/2,x-W/2,x-W/2,x-W/2,x-W/2 ]';
y3 = [y-L/2, y+L/2, y+L/4, y+L/4, y-L/4, y-L/4]';
z3 = [z, z, z-H, z-H*0.25, z-H*0.25, z-H ]';
temp3 = R*[x3';y3';z3'];
fill3(temp3(1,:),temp3(2,:),temp3(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x4 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y4 = [y-L/2,y-L/2,y-L/4,y-L/4]';
z4 = [0,0,-H,-H]';
temp4 = R*[x4';y4';z4'];
fill3(temp4(1,:),temp4(2,:),temp4(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x5 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y5 = [y+L/2,y+L/2,y+L/4,y+L/4]';
z5 = [0,0,-H,-H]';
temp5 = R*[x5';y5';z5'];
fill3(temp5(1,:),temp5(2,:),temp5(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x6 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y6 = [y-L/4, y-L/4 , y+L/4, y+L/4]';
z6 = [z-H/4, z-H/4, z-H/4, z-H/4]';
temp6 = R*[x6';y6';z6'];
fill3(temp6(1,:),temp6(2,:),temp6(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x7 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y7 = [y-L/4, y-L/4 , y-L/4, y-L/4]';
z7 = [z-H/4, z-H/4, z-H, z-H]';
temp7 = R*[x7';y7';z7'];
fill3(temp7(1,:),temp7(2,:),temp7(3,:),[84, 127, 112]/255,'FaceAlpha',1);
%%
x8 = [x-W/2, x+W/2, x+W/2, x-W/2]';
y8 = [y+L/4, y+L/4 , y+L/4, y+L/4]';
z8 = [z-H/4, z-H/4, z-H, z-H]';
temp8 = R*[x8';y8';z8'];
fill3(temp8(1,:),temp8(2,:),temp8(3,:),[84, 127, 112]/255,'FaceAlpha',1);
