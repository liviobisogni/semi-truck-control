# Feedback Linearization Control of an Articulated Vehicle

The project aims to analyze the structural properties and implement feedback linearization control of an articulated vehicle.


<p align="center">
	<a href="#prerequisite">Prerequisite</a>
	<span> • </span>
	<a href="use">Use</a>
	<span> • </span>
	<a href="doc/presentation.pdf">Presentation</a>
	<span> • </span>
	<a href="#sample-images">Sample Images</a>
</p>


## Overview
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

#### Simulink block diagram
![](img/simulink_diagram.png)


## <a id="prerequisite"></a>Prerequisite
1. [Robotics Toolbox for MATLAB](https://petercorke.com/toolboxes/robotics-toolbox/) - a package that provides functions for the study and simulation of classical arm-type and mobile robotics


## <a id="use"></a>How to Use

1. Edit `src/feedback_linearization/main_articulatedVehicle.m`:
	1. Set the simulation parameter settings, including the trajectory type (circular or sigmoid)
2. Edit `src/feedback_linearization/plot_articulatedVehicle.m`:
	1. Set `saving_flag` to 1 if you want to save plot images
	2. Set `title_flag` to 1 if you want to add titles to the plots
	3. Set `image_extension` to the file format you want to use when saving the plots (if `title_flag` is 1), e.g., 'pdf', 'png', 'jpg'.
	4. Set `images_path` to the directory where you want to save the plot images (if `title_flag` is 1), e.g., '/Users/username/Documents/MATLAB/puma560-control/img/'
	5. Set `main_path` to the directory where the source code is located (if `title_flag` is 1), e.g., '/Users/username/Documents/MATLAB/puma560-control/src/'
3. Run `src/feedback_linearization/main_articulatedVehicle.m`




## Reference
1. T. Nayl, "Modeling, Control and Path Planning for an Articulated Vehicle”, Licentiate Thesis, 2013, Department of Computer Science, Electrical and Space Engineering, Luleå University of Technology, Luleå, Sweden. [Google Scholar](https://scholar.google.com/scholar?&q=T.+Nayl%2C+%22Modeling%2C+Control+and+Path+Planning+for+an+Articulated+Vehicle%E2%75%9D%2C+Licentiate+Thesis%2C+2013%2C+Department+of+Computer+Science%2C+Electrical+and+Space+Engineering%2C+Lule%C3%A5+University+of+Technology%2C+Lule%C3%A5%2C+Sweden)


## <a id="sample-images"></a>Sample Images

### Circular trajectory
* Trajectory tracking
<p align="center" width="100%">
    <img width="75%" src="img/circle__Trajectory_tracking.png"> 
</p>
* Front axle position
<p align="center" width="100%">
    <img width="75%" src="img/circle__Front_axle_position.png"> 
</p>
* Trajectory tracking error
<p align="center" width="100%">
    <img width="75%" src="img/circle__Trajectory_tracking_error.png"> 
</p>
* Control signals and articulated angle
<p align="center" width="100%">
    <img width="75%" src="img/circle__Control_signals_and_articulated_angle.png"> 
</p>

### Sigmoid trajectory
* Trajectory tracking
<p align="center" width="100%">
    <img width="75%" src="img/sigmoid__Trajectory_tracking.png"> 
</p>
* Front axle position
<p align="center" width="100%">
    <img width="75%" src="img/sigmoid__Front_axle_position.png"> 
</p>
* Trajectory tracking error
<p align="center" width="100%">
    <img width="75%" src="img/sigmoid__Trajectory_tracking_error.png"> 
</p>
* Control signals and articulated angle
<p align="center" width="100%">
    <img width="75%" src="img/sigmoid__Control_signals_and_articulated_angle.png"> 
</p>
