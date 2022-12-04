dynamic_system = 'Dynamic.slx';
load_system(dynamic_system);
theta1_new= 9;
theta2_new= 0;
theta4_new= 0;
d3_new = 0;

set_param('Dynamic/theta1_d','value',num2str(theta1_new));
set_param('Dynamic/theta2_d','value',num2str(theta2_new));
set_param('Dynamic/theta4_d','value',num2str(theta4_new));
set_param('Dynamic/d3_d','value',num2str(d3_new));

%%
theta1_rto = get_param('Dynamic/theta1','RuntimeObject');
theta1 = theta1_rto.OutputPort(1).Data(1)
theta2_rto = get_param('Dynamic/theta2','RuntimeObject');
theta2 = theta2_rto.OutputPort(1).Data(1)
d3_rto = get_param('Dynamic/d3','RuntimeObject');
d3 = d3_rto.OutputPort(1).Data(1)
theta4_rto = get_param('Dynamic/theta4','RuntimeObject');
theta4 = theta4_rto.OutputPort(1).Data(1)
