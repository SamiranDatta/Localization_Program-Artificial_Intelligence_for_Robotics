# Localization_Program-Artificial_Intelligence_for_Robotics

This code gives an abstract idea of how Google's self driving car works as part of the Udacity course taken by Dr. Sebastian Thrun.
It implements the Monte Carlo Localization method.

The function localize takes the following arguments:

colors:
       2D list, each entry either 'R' (for red cell) or 'G' (for green cell)

measurements:
       list of measurements taken by the robot, each entry either 'R' or 'G'

motions:
       list of actions taken by the robot, each entry of the form [dy,dx],
       where dx refers to the change in the x-direction (positive meaning
       movement to the right) and dy refers to the change in the y-direction
       (positive meaning movement downward)
       NOTE: the *first* coordinate is change in y; the *second* coordinate is
             change in x

sensor_right:
       float between 0 and 1, giving the probability that any given
       measurement is correct; the probability that the measurement is
       incorrect is 1-sensor_right

p_move:
       float between 0 and 1, giving the probability that any given movement
       command takes place; the probability that the movement command fails
       (and the robot remains still) is 1-p_move; the robot will NOT overshoot
       its destination in this exercise

The function should RETURN (not just show or print) a 2D list (of the same
dimensions as colors) that gives the probabilities that the robot occupies
each cell in the world.

Compute the probabilities by assuming the robot initially has a uniform
probability of being in any cell.

Also assume that at each step, the robot:
1) first makes a movement,
2) then takes a measurement.

Motion:
 [0,0] - stay
 [0,1] - right
 [0,-1] - left
 [1,0] - down
 [-1,0] - up

The robot can move only left, right, up, or down. It cannot move diagonally. Also, for this assignment, the robot will never overshoot its destination square; it will either make the movement or it will remain stationary.
