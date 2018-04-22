function tau = controlLaw_ComputedTorque(t,model,x)

    q  = x(1:2,:);
    qd = x(3:4,:);
    
    % define the desired trajectory
    [q_d, qd_d, qdd_d] = desiredJointTrajectory(t);
    
    % define diagonal matrix Kp and Kd
    Kp = diag([100, 100]);
    Kd = diag([100, 100]);
    
    % get terms of dynamic equation
    [M, C, G, F] = RRPlanarManipulatorEquation(model, x);
    
%     tau = M*(qdd_d + Kd*(qd_d - qd) + Kp*(q_d - q)) + C*qd + F*qd + G;
    tau = 3*M*(qdd_d + Kd*(qd_d - qd) + Kp*(q_d - q)) + C*qd + F*qd + G;
%     tau = M*(qdd_d + Kd*(qd_d - qd) + Kp*(q_d - q)) + F*qd + G;
%     tau = M*(qdd_d + Kd*(qd_d - qd) + Kp*(q_d - q)) + C*qd + G;
%     tau = M*(qdd_d + Kd*(qd_d - qd) + Kp*(q_d - q)) + G;

end