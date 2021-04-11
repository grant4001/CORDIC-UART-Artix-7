# CORDIC-UART: Artix-7 Implementation

![alt text](https://github.com/grant4001/CORDIC-UART-Artix-7/blob/main/Thumbnail.PNG?raw=true)

Hi! Welcome to my CORDIC-UART Artix-7 Implementation open-source, hobby project.

### Description:

The design is a 48-stage pipelined CORDIC (modeled in SystemVerilog) calculating cos and sin of an input angle. The design is wrapped inside a UART interface with a custom messaging protocol supporting 4 instructions (SINGLE, BURST, DISABLE, ENABLE) and CRC-8 checking.

I verified the design using a custom UVM testbench. Features include: virtual sequence using weighted arbitration to send single, burst, disable, and enable transactions, an environment containing an agent for driving/monitoring the UART interface (and tracking coverage), and a scoreboard containing an evaluator and a predictor that uses a DPI-C golden reference CORDIC model.

Finally, I wrote a Python client program that enables the user to send and receive UART messages to/from the Arty-A7.

### Run instructions:

To run the simulation, check out the EDA playground link below, or if you have QuestaSim 10.7c:

cd testbench

do run.do cordic_vseq_test

To run on Vivado 2020.2, open the vivado/cordic_sincos.xpr project and run "Generate Bitstream." A ready-to-use bitstream is provided in vivado/cordic_sincos.runs/impl_1/fpga_top_module.bit

To run the client Python program (Python 3.9.1):

cd client_program

python pc_client_program.py

### Demo links:

Simulate the UVM testbench on EDA playground: https://edaplayground.com/x/9xNx (you'll need an account!)

Video demo: https://www.youtube.com/watch?v=hzrFoNM5OXQ

Video explanation of algorithm and implementation: https://www.youtube.com/watch?v=Tul1gOaTunQ

### Appendix:

For questions, please feel free to contact me at gy.4002@gmail.com. Looking forward to your inquiries!

Design language: SystemVerilog

UVM version: UVM 1.1d

Vivado version: 2020.2

Hardware platform: Digilent Arty-A7 board

Python version: 3.9.1
