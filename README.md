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
