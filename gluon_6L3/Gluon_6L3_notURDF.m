close;
clc;
clear;


L(1) = Link([0 105.03 0 0],'modified');  %[theta(i), d(i), a(i-1), alpha(i-1)]
L(2) = Link([0 80.09 0 pi/2],'modified');
L(2).offset = pi/2;

L(3) = Link([0 -84.52 174.42 0],'modified');
L(4) = Link([0 84.52 174.42 0],'modified');
L(4).offset = pi/2;
L(5) = Link([0 80.09 0 pi/2],'modified');
L(6) = Link([0 50.36 0 pi/2],'modified');


robot = SerialLink(L);
robot.plot([pi 0 0 0 0 0]);
robot.teach;
robot.display;