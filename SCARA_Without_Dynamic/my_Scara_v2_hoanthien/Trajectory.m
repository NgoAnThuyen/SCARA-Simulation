function Trajectory(handles)
v_max = str2num(get(handles.edit_v_max,'String'));
a_max = str2num(get(handles.edit_a_max,'String'));
q_max = str2num(get(handles.edit_q_max,'String'));

if (q_max > v_max^2/a_max)
%% Cal t_c

q_f = q_max;
t_c = v_max / a_max;
p_m = q_max - t_c*v_max;
t_m = p_m/v_max;
t_f = 2*t_c + t_m;

%% plot p, v, a
T_s = 0.01;
t = 0;
q_2dot =[];
q_dot = [];
q = [];
time = [];
q_0 = 0;

t = linspace(0,t_f,1000);
for i =1:1000
%1/t_f < q_c_dot/(q_f - q_0) < 2/t_f

if t(i) < t_c
q_temp = v_max /(2*t_c)*t(i)^2 +q_0;
q_dot_temp = v_max/t_c*t(i);
q_2dot_temp = v_max/t_c ;
elseif (t(i)>=t_c)&&(t(i)<t_f -t_c)
q_temp = v_max*(t(i)-t_c/2)+q_0;
q_dot_temp = v_max;
q_2dot_temp = 0;
elseif (t(i)>=(t_f-t_c))&&(t(i)<=t_f)
q_temp = -v_max/(2*t_c)*(t_f -t(i))^2 + q_f;
q_dot_temp = v_max/t_c*(t_f -t(i));
q_2dot_temp = -v_max /t_c;
end


% Update
q_2dot =[q_2dot ; q_2dot_temp];
q_dot =[q_dot ; q_dot_temp];
q =[q ; q_temp];
% time = [time; t];

end

figure('Name','Trajectory')

subplot(3,1,1)
grid on 
hold on 
xlabel('time');
y_label = sprintf('${%c}$','q');
ylabel(y_label, 'Interpreter', 'LaTeX');
plot(t,q,'linewidth',2);

subplot(3,1,2)
grid on 
hold on 
xlabel('time');
y_label = sprintf('$\\dot{%c}$','q');
ylabel(y_label, 'Interpreter', 'LaTeX');
plot(t,q_dot,'linewidth',2);

subplot(3,1,3)
grid on 
hold on 
xlabel('time');
y_label = sprintf('$\\ddot{%c}$','q');
ylabel(y_label, 'Interpreter', 'LaTeX');
plot(t,q_2dot,'linewidth',2);
else
    v_max_need = sqrt(q_max*a_max);
    f = msgbox(['the v_max must be less than ',num2str(v_max_need)]);
    set(handles.edit_v_max,'string',num2str(v_max_need));
    Trajectory(handles)
end
end