# CORDIC-UART: Artix-7 Implementation

Hi! Welcome to Grant Yu's CORDIC-UART: Artix-7 Implementation open-source, hobby project.

The design is a 48-stage pipelined CORDIC (modeled in SystemVerilog) calculating cos and sin of an input angle. The design is wrapped inside a UART interface with a custom messaging protocol supporting 4 instructions (SINGLE, BURST, DISABLE, ENABLE) and CRC-8 checking.

I verified the design using a custom UVM testbench. Features include: virtual sequence using weighted arbitration to send single, burst, disable, and enable transactions, an environment containing an agent for driving/monitoring the UART interface (and tracking coverage), and a scoreboard containing an evaluator and a predictor that uses a DPI-C golden reference CORDIC model.

Please give it a run! For a demo on the Arty-A7 FPGA board and more info, please visit https://github.com/grant4001/CORDIC. For questions, please contact me at gy.4002@gmail.com.
