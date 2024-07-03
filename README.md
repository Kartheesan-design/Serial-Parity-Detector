# Serial-Parity-Detector

Serial-Parity-Detector are used to calculate the parity of an input signal x. Parity is a simple error detection technique where an extra bit, called a parity bit, is added to the data to make the total number of 1’s either even (even parity) or odd (odd parity).

=> input x,clk; : The module takes two inputs - x which is the data signal and clk which is the clock signal.
=> output reg z; : The output of the module is z, which is the parity bit. It’s declared as a register because its value is going to be changed inside an always block.
=> reg even_odd; : This is a register used to keep track of whether the current parity is even or odd.
=> parameter EVEN = 0,ODD = 1; : These are constants representing even and odd parity.

The first always @(posedge clk) block: This block of code is executed on the positive edge of the clock signal. Inside this block, a case statement is used to check the current parity (even_odd). If it’s even and x is 1, the parity bit z is set to 1 and the parity is switched to odd. If it’s odd and x is 1, the parity bit z is set to 0 and the parity is switched to even. If x is 0, the parity bit z and the parity remain the same.

The second always @(even_odd) block: This block of code is executed whenever the parity changes. It sets the parity bit z to 0 if the parity is even and to 1 if the parity is odd.It is also used to avoid latching condition in the circuit.

This module can be used to calculate the parity of a data signal x in real-time as it changes with each clock cycle. The calculated parity bit can be used for error detection. If the data is received with the wrong parity, it means that an error has occurred during transmission.

** The output z is determined by the current state even_odd, and not directly by the input x. The state even_odd changes based on the input x and the current state, but the output z is generated based on the state even_odd alone. This is evident in the second always block.

Here, the output z is solely dependent on the current state even_odd, and not on the input x. This is the characteristic behavior of a MOORE MACHINE.
On the other hand, in a Mealy machine, the outputs are determined by both the current state and the inputs. If the output z was dependent on both the current state even_odd and the input x, then it would be a Mealy machine.
