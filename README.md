# CORDIC-UART: Artix-7 Implementation

Hi! Welcome to my CORDIC-UART Artix-7 Implementation open-source, hobby project.

The design is a 48-stage pipelined CORDIC (modeled in SystemVerilog) calculating cos and sin of an input angle. The design is wrapped inside a UART interface with a custom messaging protocol supporting 4 instructions (SINGLE, BURST, DISABLE, ENABLE) and CRC-8 checking.

I verified the design using a custom UVM testbench. Features include: virtual sequence using weighted arbitration to send single, burst, disable, and enable transactions, an environment containing an agent for driving/monitoring the UART interface (and tracking coverage), and a scoreboard containing an evaluator and a predictor that uses a DPI-C golden reference CORDIC model.

Finally, I wrote a Python client program that enables the user to send and receive UART messages to/from the Arty-A7.

Simulate the UVM testbench on EDA playground: https://edaplayground.com/x/9xNx
Video demo: https://www.youtube.com/watch?v=hzrFoNM5OXQ
Video explanation of algorithm and implementation: https://www.youtube.com/watch?v=Tul1gOaTunQ&t=467s

For questions, please feel free to contact me at gy.4002@gmail.com. Looking forward to your inquiries!

Design language: SystemVerilog
UVM version: UVM 1.1d
Vivado version: 2020.2
Hardware platform: Digilent Arty-A7 board
Python version: 3.9.1
