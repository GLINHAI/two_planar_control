clear; clear global; close all;

%%%% Two Link RR Planar model & enviroment parameters
%%%% RR means revolute joint-revolute joint
model = RRPlanarModel();
% For the damping terms, to create some noticable decceleration effects, 
% b1, b2 may need to set to 30 or above
model.b1 = 20; % dumper of joint 1, 0 => no friction
model.b2 = 20; % dumper of joint 2, 0 => no friction
model.wm = 1; % disturbance in M term, 1 => no disturbance
model.wc = 1; % disturbance in C term, 1 => no disturbance
model.wg = 1; % disturbance in G term, 1 => no disturbance

%%%% Define inital state;
% 
% the state format is: [q1; q2; q1d; q2d]
%
x0 = [deg2rad(0); deg2rad(0); deg2rad(0); deg2rad(0)]; 

%%%% Define time span for simulation
% e.g. tspan = [0 10]; => for simulation from t=0 to t=10 seconds. 
tspan = [0 15];

%%%% Control law switching
%
% controlLaw = 'Passive';
% controlLaw = 'PD';
controlLaw = 'ComputedTorque';
%controlLaw = 'JacobianTranspose';


%%%% Run simulation
[t,x] = runRRPlanarSim(model, x0, controlLaw, tspan);

%%%% Run animation
runAnimation(model, tspan, t, x, []);

%%%% Show plot
[q, qd, qdd] = desiredJointTrajectory(t);
showPlot(t,x,[q;qd;qdd]);
