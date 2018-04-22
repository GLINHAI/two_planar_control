function tau = controlLaw_JacobianTranspose(t,model,x)

    q  = x(1:2,:);
    qd = x(3:4,:);
    % put own algorithm here, tau will be the output of your controller
    tau = 0;

end