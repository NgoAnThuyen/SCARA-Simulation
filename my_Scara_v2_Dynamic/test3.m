hold on
grid on
xlabel('x');
ylabel('y');
zlabel('z');
rotate3d on
p_x = [0.65,  -0.65];
p_y = [0,  0];
p_z = [0,  0];
line(p_x,p_y,p_z)
plot3(p_x(1),p_y(1),p_z(1),'go','linewidth',5)
text(p_x(1),p_y(1),p_z(1),'p1');
plot3(p_x(2),p_y(2),p_z(2),'go','linewidth',5)
text(p_x(2),p_y(2),p_z(2),'p2');
%%
p1 = [p_x(1);p_y(1);p_z(1)];
p2 = [p_x(2);p_y(2);p_z(2)];
%% 
% Trung diem AB
I = (p1+p2)/2;
plot3(I(1),I(2),I(3),'gx','linewidth',5)
% Ban kinh R 
R = sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2)/2;
start_p = atan2(p2(2)-I(2),p2(1)-I(1))
stop_p  = atan2(p1(2)-I(2),p1(1)-I(1));
stop_p  = +mod(stop_p - start_p,2*pi)  + start_p
theta =linspace(start_p,stop_p , 50);
x = I(1) + R*cos(theta);
y = I(2) + R*sin(theta);
z = I(3) + R*sin(theta)*0;
plot3(x,y,z)
