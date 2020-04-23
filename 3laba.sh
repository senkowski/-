#!/bin/bash
polukrug(){
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[1.0, 0.0, 0.0]' '[0.0, 0.0,-3.0]'
}
rotate45(){
for (( a = 0; a < $1 ; a++ ))
do
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0,0.75]'
done
}
mrotate45(){
for (( a = 0; a < $1 ; a++ ))
do
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0,-0.75]'
done
}
move(){
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- [$1', 0.0, 0.0]' '[0.0, 0.0,0.0]'
}
teleport(){

rosservice call /turtle1/set_pen  0 0 0 5 on
rosservice call /turtle1/teleport_absolute $1 $2 0.0
rosservice call /turtle1/set_pen  $((0 + RANDOM % 255)) $((0 + RANDOM % 255)) $((0 + RANDOM % 255)) 5 off
}
dva(){
rotate45 2
polukrug
mrotate45 1
move 1
rotate45 3
move 0.8
}
chet(){
rotate45 4
move 1 
mrotate45 3
move 1
mrotate45 3
move 1.5
}
tri(){
move 0.5
polukrug
move 0.5
move -0.5
rotate45 4
polukrug
move 0.5
}
devyat(){
mrotate45 2
polukrug
polukrug
move 0.5 
polukrug
}
odin(){
rotate45 1
move 1
mrotate45 3
move 1.5
}
rosservice call /clear
teleport 0.5 6.5
dva
teleport 3.5 6
chet
teleport 4.5 7
tri
teleport 7.0 6.5
devyat
teleport 8.0 6.0
odin
teleport 9.5 6.0
odin


