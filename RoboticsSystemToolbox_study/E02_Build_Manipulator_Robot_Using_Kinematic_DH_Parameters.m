dhparams = [0   	pi/2	0   	0;
            0.4318	0       0       0;
            0.0203	-pi/2	0.15005	0;
            0   	pi/2	0.4318	0;
            0       -pi/2	0   	0;
            0       0       0       0];

        
robot = rigidBodyTree;
bodies = cell(1,6);
joints = cell(1,6);                                     % cell???
for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);         % num2str()
    joints{i} = rigidBodyJoint(['joint' num2str(i)],'revolute');   
    setFixedTransform(joints{i},dhparams(i,:),'dh');    % ???'dh'??
    bodies{i}.Joint = joints{i};
    if i == 1
        addBody(robot,bodies{i},'base');
    else
        addBody(robot,bodies{i},bodies{i-1}.Name);      % body?Name??
    end
end



showdetails(robot)
% figure(Name="PUMA Robot Model")
% show(robot)

% figure(Name="Interactive GUI")
gui = interactiveRigidBodyTree(robot,MarkerScaleFactor=0.5)


