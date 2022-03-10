#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan

COUNT = 8
TROZOS = 4
max_speed = 1
max_front_dist = 0.5

def filter(ranges):
	aux = []

	for i in ranges:
		if i > 5.0:
			aux.append(5.0)
		else:
			aux.append(i)

	return aux

def laser_scan_cb(msg):

	global TROZOS, pub, max_front_dist, max_speed
	#MAX_COUNT = len(msg.ranges)
	#INC = MAX_COUNT / COUNT


	# right_distance = msg.ranges[int(len(msg.ranges)/2)]
	# left_distance = msg.ranges[-1]
	# sector_frontal_izq = (int(len(msg.ranges)/2) - int(msg.angle_max / TROZOS / msg.angle_increment),
	# 					int(len(msg.ranges)/2) - 3)

	# sector_frontal_der = (int(len(msg.ranges)/2) + 3, 
	# 					int(len(msg.ranges)/2) + int(msg.angle_max / TROZOS / msg.angle_increment))
	
	# index = 0
	# for i in range(sector_frontal_izq[0], sector_frontal_izq[1]):
	# 	if msg.ranges[i] < 2:
	# 		index = i
	# 		break


	msg.ranges = filter(msg.ranges)

	mov = Twist()

	angle = 0
	# TODO: con el angulo y la distancia puedes tener coordenadas polares
	#		llevarlas a coordenadas cartesianas y hacer operaciones vectoriales
	
	frontal = msg.ranges[0]
	right = msg.ranges[int(msg.angle_max / TROZOS / msg.angle_increment)]
	left = msg.ranges[len(msg.ranges) - int(msg.angle_max / TROZOS / msg.angle_increment)]
	print("frontal", frontal)
	print("right", right)
	print("left", left)	
	# min_right = 30
	# for i in range(sector_frontal_der[0], sector_frontal_der[1]):
	# 	if msg.ranges[i] < 2.0:
	# 		min_right = msg.ranges[i]
	# 		break
	# 	if msg.ranges[i] < min_right:
	# 		min_right = msg.ranges[i]

	# min_left = 30
	# for i in range(sector_frontal_izq[0], sector_frontal_izq[1]):
	# 	if msg.ranges[i] < 2.0:
	# 		min_left = msg.ranges[i]
	# 		break
	# 	if msg.ranges[i] < min_left:
	# 		min_left = msg.ranges[i]

	# if min_right > min_left:
	# 	angle += 1.3
	# elif min_left > min_right:
	# 	angle -= 1.3

	if right < 1.5 or left < 1.5:
		if right > left:
			angle += 1.3
		elif left > right:
			angle -= 1.3	
	# TODO: que no empiece del tiron a correr
	if frontal > max_front_dist:
		mov.linear.x = 0.2
		#try:
		#	mov.linear.x = max_speed / (5.0/frontal)

		#except:
		#	pass
	else:
		mov.linear.x = 0

	mov.angular.z = angle

	#print(mov.linear.x)

	pub.publish(mov)


rospy.init_node("controlando_turtle_stage_node")

rospy.Subscriber('/scan', LaserScan, laser_scan_cb)
pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size=10)

rospy.spin()

rate = rospy.Rate(4)
while not rospy.is_shutdown():
	rate.sleep()
