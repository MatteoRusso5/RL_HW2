# RL_Homework-2

## :hammer: Build

Clone this package in the src folder of your ROS 2 workspace. Check for missing dependencies
$ git clone https://github.com/FedericoTr26/RL_Homework-2.git
$ rosdep install -i --from-path src --rosdistro humble -y
Build your new package

$ colcon build --packages-select RL_Homework-2
Source the setup files

$ source install/setup.bash
## :white_check_mark: Usage 🤖
First of all, launch Rviz with Gazebo with the launch file
$ ros2 launch iiwa_bringup iiwa.launch.py

Run the node specifing what trajectory and how it must be computed (0, 1, 2 ,3):  
Eventually insert by terminal the acceleration duration of the trapezoidal velocity profile and/or the radius of the circular trajectory  
(recomended values are acc_duration = 0.5 and traj_radius = 0.2)  
  
Linear trajectory using trapezoidal velocity profile (0),  
$ ros2 run ros2_kdl_package ros2_kdl_node
Linear trajectory using cubic polynomial (1),  
$ ros2 run ros2_kdl_package ros2_kdl_node 1
Circular trajectory using trapezoidal velocity profile (2),  
$ ros2 run ros2_kdl_package ros2_kdl_node 2
Circular trajectory using cubic polynomial (3),  
$ ros2 run ros2_kdl_package ros2_kdl_node 3

Note that by default the node publishes joint position commands.  
To use the velocity commands
$ ros2 run ros2_kdl_package ros2_kdl_node --ros-args -p cmd_interface:=velocity
in this case the robot must be launched with the velocity interface
$ ros2 launch iiwa_bringup iiwa.launch.py command_interface:="velocity" robot_controller:="velocity_controller"
P.S.: also in this case it's possible to specify what trajectory use (0, 1, 2, 3)  

To use the effort commands 
$ ros2 run ros2_kdl_package ros2_kdl_node --ros-args -p cmd_interface:=effort
in this case the robot must be launched with the effort interface
$ ros2 launch iiwa_bringup iiwa.launch.py command_interface:="effort" robot_controller:="effort_controller"
P.S.: also in this case it's possible to specify what trajectory use (0, 1, 2, 3)  

Note that the ros2_kdl_node is set to do an OPERATIONAL SPACE INVERSE DYNAMICS CONTROL, if you like to do a JOINT SPACE INVERSE DYNAMICS CONTROL you must change choice=1 inside the code.
