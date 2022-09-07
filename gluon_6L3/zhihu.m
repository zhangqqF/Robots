close % 关闭当前的Figure窗口
clear % 清除工作空间的所有变量
clc   % 清除命令窗口的内容，对工作环境中的全部变量无任何影响
% 这个iiwa14.urdf是系统自带的一个文件
robot = importrobot('iiwa14.urdf');
% 设置数据格式为列向量格式(或者row行向量格式)
robot.DataFormat = 'column';
% 打开一个窗口显示机器人
ax = show(robot);