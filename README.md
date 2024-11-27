# Homework 2

## :hammer: Build

Clone this package in the `src` folder of your ROS 2 workspace. Check for missing dependencies
```
$ git clone https://github.com/FedericoTr26/RL_Homework-2.git
```
```
$ rosdep install -i --from-path src --rosdistro humble -y
```
Build your new package

```
$ colcon build --packages-select RL_Homework-2
```
Source the setup files

```
$ source install/setup.bash
```
## :white_check_mark: Usage 🤖
### 1. Run Rviz and Gazebo with the launch file

Note that by default it's used the **Position Controller** ⚙️
```
$ ros2 launch iiwa_bringup iiwa.launch.py
```
### 2. Send position commands to the robot
    
***Run the node specifying what trajectory and how it must be computed (0, 1, 2 ,3):***  

⚠️ Eventually insert by terminal the acceleration duration of the trapezoidal velocity profile and/or the radius of the circular trajectory 
(recommended values are acc_duration = 0.5 and traj_radius = 0.2) ⚠️ 
  
**a) Linear trajectory using trapezoidal velocity profile (0):**  
```
$ ros2 run ros2_kdl_package ros2_kdl_node
```
**b) Linear trajectory using cubic polynomial (1):** 
```
$ ros2 run ros2_kdl_package ros2_kdl_node 1
```
**c) Circular trajectory using trapezoidal velocity profile (2):** 
```
$ ros2 run ros2_kdl_package ros2_kdl_node 2
```
**d) Circular trajectory using cubic polynomial (3):**  
```
$ ros2 run ros2_kdl_package ros2_kdl_node 3
```

## To use the Velocity Controller ⚙️
### 1. Launch Gazebo with the velocity controller
```
$ ros2 launch iiwa_bringup iiwa.launch.py command_interface:="velocity" robot_controller:="velocity_controller"
```
### 2. Send velocity commands to the robot
```
$ ros2 run ros2_kdl_package ros2_kdl_node --ros-args -p cmd_interface:=velocity
```
***P.S.: also in this case it's possible to specify what trajectory use (0, 1, 2, 3)***  

## To use the Effort Controller ⚙️
### 1. Launch Gazebo with the effort controller
 ```  
$ ros2 launch iiwa_bringup iiwa.launch.py command_interface:="effort" robot_controller:="effort_controller" 
```
### 2. Send effort commands to the robot

```
$ ros2 run ros2_kdl_package ros2_kdl_node --ros-args -p cmd_interface:=effort
```
***P.S.: also in this case it's possible to specify what trajectory use (0, 1, 2, 3)***   

### 3. To view torques sent to the robot run 
```
$ ros2 run rqt_plot rqt_plot
```
and add, as topic, `/effort_controller/commands/data[0]`, then `/effort_controller/commands/data[1]` up to `/effort_controller/commands/data[6]`
 
**Note that the ros2_kdl_node is set to do an OPERATIONAL SPACE INVERSE DYNAMICS CONTROL, if you like to do a JOINT SPACE INVERSE DYNAMICS CONTROL you must change "choice=1" inside the code on line 31.**
