hold on
grid on
xlabel('x');
ylabel('y');
zlabel('z');
rotate3d on
p_x = [0.4    0.35];
p_y = [0.4    0.35];
p_z = [-0.05 -0.15];
line(p_x,p_y,p_z)
plot3(p_x(1),p_y(1),p_z(1),'go','linewidth',5)
text(p_x(1),p_y(1),p_z(1),'p1');
plot3(p_x(2),p_y(2),p_z(2),'go','linewidth',5)
text(p_x(2),p_y(2),p_z(2),'p2');
% plot3(p_x(1)/2+p_x(2)/2,p_y(1)/2+p_y(2)/2,p_z(1)/2+p_z(2)/2,'ro','linewidth',5)
%%
p1 = [p_x(1);p_y(1);p_z(1)];
p2 = [p_x(2);p_y(2);p_z(2)];
%% 
% Vector phap tuyen
n_vec = p2 - p1;
% Trung diem AB
I = (p1+p2)/2
plot3(I(1),I(2),I(3),'gx')
syms x y z
P = dot(n_vec, [x-I(1);y-I(2);z-I(3)])
% if     (p_x(1)== p_x(2))||(p_y(1)== p_y(2))
%     x = I(1)-0.1
%     y = I(2)-0.1
%     z = eval(solve(P,z))
% elseif (p_z(1)== p_z(2))||(p_y(1)== p_y(2))
%     z = I(3)-0.1
%     y = I(2)-0.1
%     x = eval(solve(P,x))
% elseif (p_x(1)== p_x(2))||(p_z(1)== p_z(2))
%     x = I(1)-0.1
%     z = I(3)-0.1
%     y = eval(solve(P,y))
% end
if isreal(coeffs(P,x))
     z = I(3);
     y = I(2)-0.1;
     x = eval(solve(P,x));
elseif isreal(coeffs(P,y))
    x = I(1)-0.1;
    z = I(3)-0.1;
    y = eval(solve(P,y))    ;
elseif isreal(coeffs(P,z))
    x = I(1)-0.1;
    y = I(2)-0.1;
    z = eval(solve(P,z))  ;
elseif (p_x(1)== p_x(2))
    x = I(1)-0.1
    y = I(2)-0.1
    z = eval(solve(P,z))
elseif (p_z(1)== p_z(2))
    z = I(3)-0.1
    y = I(2)-0.1
    x = eval(solve(P,x))
elseif (p_y(1)== p_y(2))
    z = I(3)-0.1
    y = I(2)-0.1
    x = eval(solve(P,x))
else 
    x = I(1)-0.1;
    y = I(2)-0.1;
    z = eval(solve(P,z))  ;
end

O(1) = x;
O(2) = y;
O(3) = z;
O
% mat cau S:
R = sqrt((O(1)-p1(1))^2+(O(2)-p1(2))^2+(O(3)-p1(3))^2);
plot3(O(1),O(2),O(3),'bx','linewidth',5)
temp1 = O' - p1;
temp2 = O' - p2;
OA = (temp1);
OB = (temp2);
 z_hat = cross(OA,OB)/norm(cross(OA,OB));
%%
% gamma_max = acos(dot(OA,OB));
gamma_max = acos(dot(OA,OB)/(norm(OA)^2))
gamma = linspace(0, gamma_max ,25);
Ox = -(OA*cos(gamma) + cross(z_hat , OA)*sin(gamma));
plot3(O(1)+Ox(1,:),O(2)+Ox(2,:),O(3)+Ox(3,:),'rx')
