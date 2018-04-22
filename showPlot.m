function showPlot2(t, x, x_dsr)

    %%%% Show plot - Trajectory
    figure;
    hold on;
    plot(t, rad2deg(x(1,:)), '-r', 'LineWidth',1);
    plot(t, rad2deg(x(2,:)), '-b', 'LineWidth',1);
    plot(t, rad2deg(x_dsr(1,:)), ':r', 'LineWidth',1);
    plot(t, rad2deg(x_dsr(2,:)), ':b', 'LineWidth',1);
    xlabel('t');
    ylabel('Joint angle (degree)');
    title('Joint Angle Trajectory');
    legend('q_1', 'q_2','desired q_1', 'desired q_2');
    hold off;

    %%%% Show plot - Velocity
    figure;
    hold on;
    plot(t, rad2deg(x(3,:)), '-r', 'LineWidth',1);
    plot(t, rad2deg(x(4,:)), '-b', 'LineWidth',1);
    plot(t, rad2deg(x_dsr(3,:)), ':r', 'LineWidth',1);
    plot(t, rad2deg(x_dsr(4,:)), ':b', 'LineWidth',1);
    xlabel('t');
    ylabel('angular velocity (degree/s)');
    title('Joint Angular Velocity');
    legend('q_1', 'q_2', 'desired q_1', 'desired q_2');
    hold off;
    
    %%%% Show plot of position error
    figure;
    hold on;
    plot(t, (rad2deg(x_dsr(1,:)) - rad2deg(x(1,:))), '-r', 'LineWidth', 1);
    plot(t, (rad2deg(x_dsr(2,:)) - rad2deg(x(2,:))), '-b', 'LineWidth', 1);
    plot([0 t(end)], [1 1], '-.ko');
    plot([0 t(end)], [-1 -1], '-.ko');
    xlabel('t');
    ylabel('Error of Joint Angle (degree)');
    title('Error of Each Joint');
    legend('q1-error', 'q2-error', '±1 dgree');
    hold off;
end