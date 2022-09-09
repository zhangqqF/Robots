

robot = rigidBodyTree;

% ---------------------- Body1 ------------------------------------------
body1 = rigidBody('body1'); % Create a rigid body
joint1 = rigidBodyJoint('joint1','revolute');   % Create a joint
joint1.HomePosition = pi/4; % Initial angle
tform = trvec2tform([0.25, 0.25, 0]); % position of the joint
setFixedTransform(joint1,tform);
body1.Joint = joint1;

addBody(robot,body1,'base')
% -----------------------------------------------------------------------



% ---------------------- Body2 ------------------------------------------
body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','revolute');
jnt2.HomePosition = pi/6;
tform2 = trvec2tform([1, 0, 0]);
setFixedTransform(jnt2,tform2);
body2.Joint = jnt2;
addBody(robot,body2,'body1'); % Add body2 to body1
% -----------------------------------------------------------------------



% ---------------------- Body3, 4 ---------------------------------------
body3 = rigidBody('body3');
body4 = rigidBody('body4');
jnt3 = rigidBodyJoint('jnt3','revolute');
jnt4 = rigidBodyJoint('jnt4','revolute');
tform3 = trvec2tform([0.6, -0.1, 0])*eul2tform([-pi/2, 0, 0]); % ??????Z???
tform4 = trvec2tform([1, 0, 0]);
setFixedTransform(jnt3,tform3);
setFixedTransform(jnt4,tform4);
body3.Joint = jnt3;
body4.Joint = jnt4;
addBody(robot,body3,'body2'); % Add body3 to body2
addBody(robot,body4,'body2'); % Add body4 to body2
% -----------------------------------------------------------------------



% ---------------------- end effector -----------------------------------
bodyEndEffector = rigidBody('endeffector');
tform5 = trvec2tform([0.5, 0, 0]);
setFixedTransform(bodyEndEffector.Joint,tform5); % ??????joint????
addBody(robot,bodyEndEffector,'body4');
% -----------------------------------------------------------------------



% ??end effector???base?????
config = randomConfiguration(robot);
tform = getTransform(robot,config,'endeffector','base')


% subtree
newArm = subtree(robot,'body2');
removeBody(newArm,'body3');
removeBody(newArm,'endeffector');



newBody1 = copy(getBody(newArm,'body2'));
newBody2 = copy(getBody(newArm,'body4'));
newBody1.Name = 'newBody1';
newBody2.Name = 'newBody2';
newBody1.Joint = rigidBodyJoint('newJnt1','revolute');
newBody2.Joint = rigidBodyJoint('newJnt2','revolute');
tformTree = trvec2tform([0.2, 0, 0]);
setFixedTransform(newBody1.Joint,tformTree);
replaceBody(newArm,'body2',newBody1);
replaceBody(newArm,'body4',newBody2);

addSubtree(robot,'body1',newArm);



% showdetails(robot);
% show(robot)
hold on
show(newArm)