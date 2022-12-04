function my_fcn(block)
% Level-2 MATLAB file S-Function for system identification using 
% Least Mean Squares (LMS).
%   Copyright 1990-2011 The MathWorks, Inc.
  setup(block);
  
%endfunction

function setup(block)

%% Register a single dialog parameter
block.NumDialogPrms  = 1;

%% Register number of input and output ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

%% Setup functional port properties to dynamically
%% inherited.
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

%% Hard-code certain port properties
block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DirectFeedthrough = false;

block.OutputPort(1).Dimensions       = 1;

%% Set block sample time to [0.1 0]
block.SampleTimes = [0.1 0];

%% Register methods
block.RegBlockMethod('PostPropagationSetup',@DoPostPropSetup);
block.RegBlockMethod('InitializeConditions',@InitConditions);
block.RegBlockMethod('Outputs',             @Output);  
block.RegBlockMethod('Update',              @Update);

function DoPostPropSetup(block)
  %% Setup Dwork
  block.NumDworks = 1;
  block.Dwork(1).Name = 'x0'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;
  
function InitConditions(block)
  %% Initialize Dwork
  block.Dwork(1).Data = block.DialogPrm(1).Data;
  
function Output(block)
  block.OutputPort(1).Data = block.Dwork(1).Data;
  
function Update(block)
  block.Dwork(1).Data = block.InputPort(1).Data;