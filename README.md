# Timed-State-Machine-Traffic-Light-Controller-using-VHDL

## Introduction:
VHDL program of Timed State Machine for Traffic Light Controller. The time of each state is pre-defined. The state is used to define the executing logic and time delay for the red, yellow and green lights of the traffic light controller. All modes have to be verified by simulation.

| <img src="./Simulation/Timed State Machine.PNG"> |
|:--:| 
| *Timed State Machine for Traffic Light Controller* |

The above given state machine diagram depicts the complete logic of our Timed State Machine based Traffic Light Controller.

* St_stop is the idle state, whenever the system resets its start from St_stop, and only red light is high in this state.
* If the input start is active then the transition condition from state st_stop to st_red take place, in st_red only red light is high for 3 additional clock cycles, means total of four clock cycles.
* After four clock cycles transition take place from state st_red to st_redyel, in state st_redyel red and yellow light are high for one clock cycle.
* After one clock cycle transition take place from state st_redyel to st_green, in state st_green green light is high for 4 additional clock cycles, means total of five clock cycles.
* After five clock cycles transition take place from state st_green to st_yel, in state st_yel yellow light is high for one clock cycle.
* Finally, if the input start is active then the transition take place from st_yel to st_red and repeats state cycle again, or if the input start is inactive then then the transition take place from st_yel to the idle state st_stop.

## Algorithm Description:

### Library:
* Using the “use” statement, all components of the package “STD_LOGIC_1164” part of library IEEE are visible for later use in the VHDL code. “Library” statement is included above the “use” statement so that compiler would know that “IEEE” is a library.
* VHDL datatype “STD_LOGIC” and rising_edge () is declared in IEEE.STD_LOGIC_1164.

### Entity:
Entity declaration represents the external interface to the design entity. Entity statement declares the design name; here it is “tlctsm”. This interface consists of the following input and output ports:

#### System Inputs:
* reset - state machine reset (synchronous)
* clk - system clock
* start - starts TLC cycle

#### System outputs:
* red - red light
* yellow - yellow/amber light
* green - green light

### Architecture:
* In the entity a new type is defined with name “State_type” having values parameters as “st_stop”, “st_red”, “st_redyel”, “st_green”, and “st_yel”.
* 2 Signals named State & next State is defined which are of type State_type.
* A constant “MAX_COUNT” with a value of 10 is defined.
* Subytype named Count_type with an range of 0 to 9 is defined.
* Signal await_clks of Count_type type is defined. This signal determines the additional number of clock cycles a state is active. It has a default of 0, i.e. it stay active for one clock cycle.
* Number of cloch cycles / state:
<p align="center">st_red: 4 clock cycles</p>
<p align="center">st_ry: 1 clock cycle</p>
<p align="center">st_green: 5 clock cycles</p>
<p align="center">st_yel: 1 clock cycle</p>

* The process “seq_p” and “cmb_p” are defined to implement the Timed State Machine based Traffic Light Controller. Both processes execute parallel.

#### Process seq_p:
In sequential logic, the output is dependent on both the present input and the state (memory, based on earlier inputs). Therefore, sequential logic has memory.

The sequential block executes every time with the rising edge of the clock. Upon the rising edge, it checks first for the reset condition. If the reset is not active then it assigns the next state, otherwise, it remains in the idle state.

Beacuse it is a timed state machine, the next state is not assigned immediately but only after the predefined time for the state is met. The delay for the transition to the next_state is modeled using the signal await_clks.

#### Process cmb_p:
In combinational logic the output is only dependent on the present input. Therefore, sequential logic does not have the memory.

The combinational block is used to define the next state transition condition as well as to assign the outputs of the states. The sensitivity list of the combinational block consists of the state and start signals. Hence, whenever there is a change in this signal the combinational process is computed by the simulator.

The start signal turns on the state machine and the controller exits the st_stop state and switches to st_red. This current state is assigned as a state to the controller on the next rising edge of the clock. So, now the combinational block takes the action on the output signals, define the time duration of this state and compute the next_state. This next_state is assigned to the controller when the time duration await_clks is completed, on the rising edge of the system clock. The controller repeats the process until st_yel, and after st_yel controller check if start is 1 then the state switches from st_yel to st_red and repeats state cycle, or if the start is 0 then the state st_yel switches to the idle state st_stop.
