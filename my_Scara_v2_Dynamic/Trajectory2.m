function Trajectory2(handles)
    
if get(handles.radiobutton_linear,'value') == 1
    path_planning_type = 'linear';
elseif get(handles.radiobutton_circular,'value') == 1
    path_planning_type = 'circular';
elseif get(handles.radiobutton_2d_circular,'value') == 1
    path_planning_type = '2d circular';
end

if strcmp(path_planning_type,'linear')
    [q_max,my_alpha,my_beta,x_sign,y_sign,z_sign,p_x_old,p_y_old,p_z_old]= PathPlanning(handles);
elseif strcmp(path_planning_type,'circular')
    [q_max, gamma_max, OA,z_hat, O_cir]= PathPlanning2(handles);
elseif strcmp(path_planning_type,'2d circular')
    [q_max,start_p, stop_p ,R, I ]= PathPlanning3(handles);
end
v_max = str2num(get(handles.edit_v_max,'String'));
a_max = str2num(get(handles.edit_a_max,'String'));
if q_max ~= 0
if (v_max <= sqrt(q_max*a_max/2))
%% Cal t_c, t_f

t_c = 2*v_max /a_max;
t_m = (q_max -v_max*t_c)/v_max;
t_f = t_m +2*t_c;


%% plot p, v, a
q_2dot =[];
q_dot = [];
q = [];
%
theta1_ref = [];
theta2_ref = [];
d3_ref = [];
theta4_ref = [];
%
theta1_ = [];
theta1_dot= [];
theta1_2dot= [];
theta2_ = [];
theta2_dot= [];
theta2_2dot= [];
theta4_ = [];
theta4_dot= [];
theta4_2dot= [];
d3_ = [];
d3_dot = [];
d3_2dot = [];
% theo jacobian 
time  = [] ;
time_update=0;

%%
% define some axes
cla(handles.ax_q,'reset');
grid(handles.ax_q,'on'); 
hold(handles.ax_q,'on'); 
y_label = sprintf('${%c}$','q');
ylabel(handles.ax_q,y_label, 'Interpreter', 'LaTeX','fontsize',15);


cla(handles.ax_q_dot,'reset');
grid(handles.ax_q_dot,'on'); 
hold(handles.ax_q_dot,'on'); 
% xlabel(handles.ax_q_dot,'time');
y_label = sprintf('$\\dot{%c}$','q');
ylabel(handles.ax_q_dot,y_label, 'Interpreter', 'LaTeX','fontsize',15);


cla(handles.ax_q_2dot,'reset');
grid(handles.ax_q_2dot,'on'); 
hold(handles.ax_q_2dot,'on'); 
xlabel(handles.ax_q_2dot,'Time (s)');
y_label = sprintf('$\\ddot{%c}$','q');
ylabel(handles.ax_q_2dot,y_label, 'Interpreter', 'LaTeX','fontsize',15);
%-------------------------------------------------------------------------

cla(handles.ax_q_x,'reset');
grid(handles.ax_q_x,'on'); 
hold(handles.ax_q_x,'on'); 
% xlabel(handles.ax_q_x,'time');
str2='$$q_x$$';
ylabel(handles.ax_q_x,str2,'interpreter','latex','fontsize',13,'fontweight','bold');


cla(handles.ax_q_x_dot,'reset');
grid(handles.ax_q_x_dot,'on'); 
hold(handles.ax_q_x_dot,'on'); 
% xlabel(handles.ax_q_x_dot,'time');
str2='$$v_x$$';
ylabel(handles.ax_q_x_dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_x_2dot,'reset');
grid(handles.ax_q_x_2dot,'on'); 
hold(handles.ax_q_x_2dot,'on'); 
% xlabel(handles.ax_q_x_2dot,'time');
str2='$$a_x$$';
ylabel(handles.ax_q_x_2dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_y,'reset');
grid(handles.ax_q_y,'on'); 
hold(handles.ax_q_y,'on'); 
% xlabel(handles.ax_q_y,'time');
str2='$$q_y$$';
ylabel(handles.ax_q_y,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_y_dot,'reset');
grid(handles.ax_q_y_dot,'on'); 
hold(handles.ax_q_y_dot,'on'); 
% xlabel(handles.ax_q_y_dot,'time');
str2='$$v_y$$';
ylabel(handles.ax_q_y_dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_y_2dot,'reset');
grid(handles.ax_q_y_2dot,'on'); 
hold(handles.ax_q_y_2dot,'on'); 
% xlabel(handles.ax_q_y_2dot,'time');
str2='$$a_x$$';
ylabel(handles.ax_q_y_2dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_z,'reset');
grid(handles.ax_q_z,'on'); 
hold(handles.ax_q_z,'on'); 
xlabel(handles.ax_q_z,'time');
str2='$$q_z$$';
ylabel(handles.ax_q_z,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_z_dot,'reset');
grid(handles.ax_q_z_dot,'on'); 
hold(handles.ax_q_z_dot,'on'); 
xlabel(handles.ax_q_z_dot,'time');
str2='$$v_z$$';
ylabel(handles.ax_q_z_dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');

cla(handles.ax_q_z_2dot,'reset');
grid(handles.ax_q_z_2dot,'on'); 
hold(handles.ax_q_z_2dot,'on'); 
xlabel(handles.ax_q_z_2dot,'time');
str2='$$a_x$$';
ylabel(handles.ax_q_z_2dot,str2,'interpreter','latex','fontsize',13,'fontweight','bold');



% cla

cla(handles.ax_theta1,'reset');
grid(handles.ax_theta1,'on'); 
hold(handles.ax_theta1,'on'); 
str2='$$\theta_1 (Deg)$$';
ylabel(handles.ax_theta1,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta1_dot,'reset');
grid(handles.ax_theta1_dot,'on'); 
hold(handles.ax_theta1_dot,'on'); 
str2='$$\omega_1 (Deg/s)$$';
ylabel(handles.ax_theta1_dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta1_2dot,'reset');
grid(handles.ax_theta1_2dot,'on'); 
hold(handles.ax_theta1_2dot,'on'); 
% xlabel(handles.ax_theta1_2dot,'time');
str2='$$a_1 (Deg/s^2)$$';
ylabel(handles.ax_theta1_2dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta2,'reset');
grid(handles.ax_theta2,'on'); 
hold(handles.ax_theta2,'on'); 
% xlabel(handles.ax_theta2,'time');
str2='$$\theta_2(Deg)$$';
ylabel(handles.ax_theta2,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta2_dot,'reset');
grid(handles.ax_theta2_dot,'on'); 
hold(handles.ax_theta2_dot,'on'); 
% xlabel(handles.ax_theta2_dot,'time');
str2='$$\omega_2(Deg/s)$$';
ylabel(handles.ax_theta2_dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta2_2dot,'reset');
grid(handles.ax_theta2_2dot,'on'); 
hold(handles.ax_theta2_2dot,'on'); 
% xlabel(handles.ax_theta2_2dot,'time');
str2='$$a_2(Deg/s^2)$$';
ylabel(handles.ax_theta2_2dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta4,'reset');
grid(handles.ax_theta4,'on'); 
hold(handles.ax_theta4,'on'); 
% xlabel(handles.ax_theta4,'time');
str2='$$\theta_4(Deg)$$';
ylabel(handles.ax_theta4,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta4_dot,'reset');
grid(handles.ax_theta4_dot,'on'); 
hold(handles.ax_theta4_dot,'on'); 
% xlabel(handles.ax_theta4_dot,'time');
str2='$$\omega_4(Deg/s)$$';
ylabel(handles.ax_theta4_dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_theta4_2dot,'reset');
grid(handles.ax_theta4_2dot,'on'); 
hold(handles.ax_theta4_2dot,'on'); 
% xlabel(handles.ax_theta4_2dot,'time');
str2='$$a_4(Deg/s^2)$$';
ylabel(handles.ax_theta4_2dot,str2,'interpreter','latex','fontsize',12,'fontweight','bold');

cla(handles.ax_d3,'reset');
grid(handles.ax_d3,'on'); 
hold(handles.ax_d3,'on'); 
% xlabel(handles.ax_d3,'time');
str2='$$d_3(m)$$';
ylabel(handles.ax_d3,str2,'interpreter','latex','fontsize',14,'fontweight','bold');

cla(handles.ax_d3_dot,'reset');
grid(handles.ax_d3_dot,'on'); 
hold(handles.ax_d3_dot,'on'); 
% xlabel(handles.ax_d3_dot,'time');
str2='$$v_{d_3(m/s)}$$';
ylabel(handles.ax_d3_dot,str2,'interpreter','latex','fontsize',14,'fontweight','bold');


cla(handles.ax_d3_2dot,'reset');
hold(handles.ax_d3_2dot,'on'); 
% xlabel(handles.ax_d3_2dot,'time');
str2='$$a_{d_3(m^2/s)}$$';
ylabel(handles.ax_d3_2dot,str2,'interpreter','latex','fontsize',14,'fontweight','bold');

%%

N =50;
t = linspace(0,t_f,N);
for i =1:N

if t(i) < t_c/2
    q_2dot_temp = 2*a_max/t_c*t(i);
    q_dot_temp = a_max/t_c*t(i)^2;
    q_temp = a_max/t_c*t(i)^3/3; 
elseif (t(i)>=t_c/2)&&(t(i) < t_c)
    q_2dot_temp = -2*a_max/t_c*(t(i)-t_c);
    q_dot_temp = -2*a_max/t_c*(t(i)^2/2-t_c*t(i))+v_max-a_max*t_c;
    q_temp = -2*a_max/t_c*(t(i)^3/6-t(i)^2*t_c/2)+(v_max-a_max*t_c)*t(i)+a_max*t_c^2/3-v_max*t_c/2; 
elseif (t(i)>=(t_c))&&(t(i)<(t_f-t_c))
    q_2dot_temp = 0;
    q_dot_temp = v_max;
    q_temp = v_max*t(i)-v_max*t_c/2;
elseif (t(i)>=(t_f-t_c))&&(t(i)<(t_f-t_c/2))
    q_2dot_temp = -2*a_max/t_c*(t(i)-(t_f-t_c));
    q_dot_temp = -2*a_max/t_c*(t(i)^2/2-(t_f-t_c)*t(i))+v_max - a_max/t_c*(t_f-t_c)^2;
    q_temp = -2*a_max/t_c*(t(i)^3/6-t(i)^2*(t_f-t_c)/2)+(v_max-a_max/t_c*(t_f-t_c)^2)*t(i)+1/3*a_max/t_c*(t_f-t_c)^3-v_max*t_c/2; 
elseif (t(i)>=(t_f-t_c/2))&&(t(i)<=(t_f))
    q_2dot_temp = 2*a_max/t_c*(t(i)-t_f);
    q_dot_temp = 2*a_max/t_c*(t(i)^2/2-t_f*t(i))+a_max/t_c*t_f^2;
    q_temp = 2*a_max/t_c*(t(i)^3/6-t_f*t(i)^2/2)+a_max/t_c*t_f^2*t(i)+q_max - a_max/(3*t_c)*t_f^3;
end


% Update
q_2dot = [q_2dot ; q_2dot_temp];
q_dot  = [q_dot ; q_dot_temp];
q      = [q ; q_temp];
time  = [time ; time_update];
time_update = time_update + t_f/N; 

%--------------------------------------------------------------------------
%Linear path planning
if strcmp(path_planning_type,'linear')
% Calc and plot q_x, q_y, q_z
q_x  = p_x_old + x_sign * q * sin(my_beta) * cos(my_alpha)              ;
q_y  = p_y_old + y_sign * q * sin(my_beta) * sin(abs(my_alpha))         ;
q_z  = p_z_old + z_sign * q * abs( cos(my_beta))                        ;
% Calc and plot q_x_dot, q_y_dot, q_z_dot
q_x_dot  = x_sign * q_dot * sin(my_beta) * cos(my_alpha)              ;
q_y_dot  = y_sign * q_dot * sin(my_beta) * sin(abs(my_alpha))         ;
q_z_dot  = z_sign * q_dot * abs( cos(my_beta))                        ;
% Calc and plot q_x_dot, q_y_dot, q_z_dot
q_x_2dot  = x_sign * q_2dot * sin(my_beta)* cos(my_alpha)            ;
q_y_2dot  = y_sign * q_2dot * sin(my_beta) * sin(abs(my_alpha))       ;
q_z_2dot  = z_sign * q_2dot * abs( cos(my_beta))                      ;
% executing...
elseif strcmp(path_planning_type,'2d circular') % q_max tuong duong gamma_max ; q tuong duong gamma;
    %
    th = q/q_max* (stop_p-start_p) + start_p;
    q_x = I(1) + R*cos(th);
    q_y = I(2) + R*sin(th);
    q_z = I(3) + R*sin(th)*0;
    %
    % Calc and plot q_x_dot, q_y_dot, q_z_dot
    th_dot   = q_dot/q_max* (stop_p-start_p);
    q_x_dot = -R.*th_dot.*sin(th);
    q_y_dot =  R.*th_dot.*cos(th);
    q_z_dot = (th_dot.*R.*cos(th))*0;% khong quan tam
      
% Calc and plot q_x_dot, q_y_dot, q_z_dot
    th_2dot   = q_2dot/q_max* (stop_p-start_p);
    q_x_2dot  = R.*(th_2dot.*cos(th)-th_2dot.^2.*sin(th)) ;
    q_y_2dot  = (I(1) + R*cos(th));
    q_z_2dot  =  (th_dot.*R.*cos(th))*0; % khong quan tam
    
elseif strcmp(path_planning_type,'circular') % q_max tuong duong gamma_max ; q tuong duong gamma;
    %
    gamma = (q * gamma_max/q_max)';
    Ox = -(cos(gamma).*OA + sin(gamma).*cross(z_hat , OA));
    q_x  = O_cir(1) + Ox(1,:)   ;
    q_y  = O_cir(2) + Ox(2,:)   ;
    q_z  = O_cir(3) + Ox(3,:)   ;
    %
    % Calc and plot q_x_dot, q_y_dot, q_z_dot
    gamma_dot = (q_dot  * gamma_max/q_max)';
    Ox_dot = -(-gamma_dot.*sin(gamma).*OA + gamma_dot.*cos(gamma).*cross(z_hat , OA));
    q_x_dot  = Ox_dot(1,:);             
    q_y_dot  = Ox_dot(2,:);
    q_z_dot  = Ox_dot(3,:);           
      
% Calc and plot q_x_dot, q_y_dot, q_z_dot
    gamma_2dot = (q_2dot * gamma_max/q_max)';
    Ox_2dot = (gamma_2dot.*sin(gamma).*OA + gamma_dot.^2.*cos(gamma).*OA ...
        - gamma_2dot.*cos(gamma).*cross(z_hat , OA) + gamma_dot.^2.*sin(gamma).*cross(z_hat , OA));
    q_x_2dot  =  Ox_2dot(1,:)  ;
    q_y_2dot  =  Ox_2dot(2,:)  ;     
    q_z_2dot  =  Ox_2dot(3,:)  ;        
end

%--------------------------------------------------------------------------

 [break_signal,req,res] = Calc_Inverse_Dynamic(handles,q_x(end),q_y(end),q_z(end),0);
if break_signal
    break
end

theta1_new = res(1);
theta2_new = res(2);
d3_new = res(3);
theta4_new = res(4);

theta1_ = [theta1_;theta1_new];
theta1_ = abs(theta1_).*sign(theta1_);
theta2_ = [theta2_;theta2_new];
theta2_ = abs(theta2_).*sign(theta2_);
theta4_ = [theta4_;theta4_new];
d3_ = [d3_;d3_new];

theta1_ref = [theta1_ref;req(1)];
theta2_ref = [theta2_ref;req(2) ];
d3_ref = [d3_ref; req(3)];
theta4_ref = [theta4_ref;req(4) ];



if i>1
theta1_dot = [theta1_dot; (theta1_(i)-theta1_(i-1))/t_f*50];
theta2_dot = [theta2_dot; (theta2_(i)-theta2_(i-1))/t_f*50];
theta4_dot = [theta4_dot; (theta4_(i)-theta4_(i-1))/t_f*50];
d3_dot     = [d3_dot    ; (d3_(i)-d3_(i-1))/t_f*50];
end

if(i>2)
theta1_2dot = [theta1_2dot; (theta1_dot(i-1)-theta1_dot(i-2))/t_f*50];
theta2_2dot = [theta2_2dot; (theta2_dot(i-1)-theta2_dot(i-2))/t_f*50];
theta4_2dot = [theta4_2dot; (theta4_dot(i-1)-theta4_dot(i-2))/t_f*50];
d3_2dot     = [d3_2dot    ; (d3_dot(i-1)-d3_dot(i-2))/t_f*50];
end


%
pause(t_f/N);
% plot 

plot(handles.ax_q,time,q,'linewidth',2);
grid(handles.ax_q,'on'); 
plot(handles.ax_q_dot,time,q_dot,'linewidth',2);
grid(handles.ax_q_dot,'on'); 
plot(handles.ax_q_2dot,time,q_2dot,'linewidth',2);
grid(handles.ax_q_2dot,'on'); 

plot(handles.ax_q_x,time,q_x,'linewidth',2);
grid(handles.ax_q_x,'on'); 
plot(handles.ax_q_x_dot,time,q_x_dot,'linewidth',2);
grid(handles.ax_q_x_dot,'on'); 
plot(handles.ax_q_x_2dot,time,q_x_2dot,'linewidth',2);
grid(handles.ax_q_x_2dot,'on'); 

plot(handles.ax_q_y,time,q_y,'linewidth',2);
grid(handles.ax_q_y,'on'); 
plot(handles.ax_q_y_dot,time,q_y_dot,'linewidth',2);
grid(handles.ax_q_y_dot,'on'); 
plot(handles.ax_q_y_2dot,time,q_y_2dot,'linewidth',2);
grid(handles.ax_q_y_2dot,'on'); 

plot(handles.ax_q_z,time,q_z,'linewidth',2);
grid(handles.ax_q_z,'on'); 
plot(handles.ax_q_z_dot,time,q_z_dot,'linewidth',2);
grid(handles.ax_q_z_dot,'on'); 
plot(handles.ax_q_z_2dot,time,q_z_2dot,'linewidth',2);
grid(handles.ax_q_z_2dot,'on'); 

plot(handles.ax_theta1,time,theta1_*180/pi,'linewidth',2);
plot(handles.ax_theta1,time,theta1_ref*180/pi,'linewidth',2);
xticklabels(handles.ax_theta1,''); 
plot(handles.ax_theta2,time,theta2_*180/pi,'linewidth',2);
plot(handles.ax_theta2,time,theta2_ref*180/pi,'linewidth',2);
xticklabels(handles.ax_theta2,'');  
plot(handles.ax_theta4,time,theta4_*180/pi,'linewidth',2);
plot(handles.ax_theta4,time,theta4_ref*180/pi,'linewidth',2);
xticklabels(handles.ax_theta4,''); 
plot(handles.ax_d3,time,d3_,'linewidth',2);
plot(handles.ax_d3,time,d3_ref,'linewidth',2);
xticklabels(handles.ax_d3,''); 

plot(handles.ax_theta1_dot,time(1:end-1),theta1_dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta1_dot,''); 
plot(handles.ax_theta2_dot,time(1:end-1),theta2_dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta2_dot,''); 
plot(handles.ax_theta4_dot,time(1:end-1),theta4_dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta4_dot,'');  
plot(handles.ax_d3_dot,time(1:end-1),d3_dot,'linewidth',2);
xticklabels(handles.ax_d3_dot,''); 

plot(handles.ax_theta1_2dot,time(1:end-2),theta1_2dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta1_2dot,''); 
plot(handles.ax_theta2_2dot,time(1:end-2),theta2_2dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta2_2dot,''); 
plot(handles.ax_theta4_2dot,time(1:end-2),theta4_2dot*180/pi,'linewidth',2);
xticklabels(handles.ax_theta4_2dot,''); 
plot(handles.ax_d3_2dot,time(1:end-2),d3_2dot,'linewidth',2);
xticklabels(handles.ax_d3_2dot,''); 





% plot_robot(handles);
plot3(handles.axes1,q_x,q_y,q_z,'b','linewidth',2);
end

%% Plot result
else
    v_max_need = sqrt(q_max*a_max/2);
%     f = msgbox(['the v_max must be less than ',num2str(v_max_need)]);
    set(handles.edit_v_max,'string',num2str(v_max_need-0.0005));
    Trajectory2(handles)
end
end
