robot = importrobot('iiwa14.urdf');
showdetails(robot);


% show(robot);
% show(robot,robot.homeConfiguration);
show(robot,robot.randomConfiguration);


% robot.DataFormat='row';
% show(robot,[0 pi/3 0 pi/2 0 0 0]); % only revolute joints



% Homogeneous transformation（齐次变换）
robot.DataFormat='row';
tform = getTransform(robot,[0 pi/3 0 pi/2 0 0 0],'iiwa_link_ee_kuka','iiwa_link_0'); % 变换角度参数不能省，且必先设置DataFormat



% 逆向运动学
ik = robotics.InverseKinematics('RigidBodyTree',robot);
weights = [0.25 0.25 0.25 1 1 1]; % 6维，表示什么？tform的角度的7维
initialguess = robot.homeConfiguration;
[configSoin,soinInfo] = ik('iiwa_link_ee_kuka',tform,weights,initialguess)


% 逆向动力学
robot.Gravity = [0 0 9.810];
jointTorq = inverseDynamics(robot,[0 pi/3 0 pi/2 0 0 0]);

