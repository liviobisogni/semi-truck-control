# Feedback Linearization Control of an Articulated Vehicle

The project aims to analyze the structural properties and implement feedback linearization control of an articulated vehicle, the Load-Haul-Dump (LHD).

The repository includes the following:

* The vehicle model and its kinematic equations
* Analysis of the structural properties such as accessibility, controllability, and observability
* Implementation of feedback linearization control and simulation of the system
* Simulink diagram of the system
* Sigmoid and circumference functions used in the simulation


## Feedback Linearization Control
Feedback linearization control is implemented to control the articulated vehicle. The state vector q is defined as [x, y, theta, gamma] and the input vector u is defined as [v, gamma_dot]. The system is expressed in the following form:

q_dot = Aq + Bf(q)u

where A and B are the system matrices and f(q) is a nonlinear function. Feedback linearization is then applied to convert the nonlinear system into a linear one, which can be controlled easily.

### Simulink block diagram
![](img/simulink_diagram.png)


## Simulations

### Circular trajectory
* Trajectory tracking
![](img/circle__Trajectory_tracking.pdf)
* Front axle position
![](img/circle__Front_axle_position.pdf)
* Trajectory tracking error
![](img/circle__Trajectory_tracking_error.pdf)
* Control signals and articulated angle
![](img/circle__Control_signals_and_articulated_angle.pdf)

### Sigmoid trajectory
* Trajectory tracking
![](img/sigmoid__Trajectory_tracking.pdf)
* Front axle position
![](img/sigmoid__Front_axle_position.pdf)
* Trajectory tracking error
![](img/sigmoid__Trajectory_tracking_error.pdf)
* Control signals and articulated angle
![](img/sigmoid__Control_signals_and_articulated_angle.pdf)
