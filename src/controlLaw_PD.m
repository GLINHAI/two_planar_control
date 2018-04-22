function tau = controlLaw_PD(t,model,x)

    
    % Obtain the current joint position and velocity
    q  = x(1:2,:);
    qd = x(3:4,:);
    
    % Sample code for a PD controller 
    % with gravity compensation for trajetory tracking
    
    % (1) Please define your desiredJointTrajectory(t) 
    %     use the desiredJointTrajectory(t) to generate the desired
    %     trajectory
    [q_d, qd_d, qdd_d] = desiredJointTrajectory(t);
    
    
    % (2) Define the diagonal matrix for Kp and Kd, 
    %     choose your own gains
    Kp = diag([20000, 20000]);
    Kd = diag([50, 200]);

    % (3) Get the gravity term using the function
    %     RRPlanarManipulatorEquation(model, x);
    [M, C, G, F] = RRPlanarManipulatorEquation(model, x);
    
    % (4) create the overall controller and apply to tau
    tau = G + Kd*(qd_d - qd) + Kp*(q_d - q);% + F*qd + C*qd;
%     tau = G + F * qd + C * qd + Kp * (q_d - q) - Kd * qd;
%     tau = M*(qdd_d - Kd*(qd) + Kp*(q_d - q)) + C*qd + F*qd + G;

end