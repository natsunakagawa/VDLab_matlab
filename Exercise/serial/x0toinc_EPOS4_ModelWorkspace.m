% x0toinc_EPOS4_ModelWorkspace
% Model explorer -> Model Workspace

%% Serial mode
Serial_mode = 2; 

%   0:Traget position 
%   1:QuickStop 
%   2:Shutdown 
%   3:Switch on and enable
%   4:Fault reset 1
%   5:Fault reset 2
%
% ** disable->enable => Shutdoun->Switch on and enable
% ** quickstop->enable => QuickStop -> Switch on and enable
% ** Red LED(Fault)->Green LED => Fault reset 1->Fault reset 2

%% Slider Crank 
%%% culcurate x'0 to Theta_a

Gear = 1;
enc_pulse = 1000;
inc_center = 1000;
% Gear = 113;
% enc_pulse = 500;
% inc_center = 26500; 

