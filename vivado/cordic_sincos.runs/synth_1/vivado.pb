
~
Command: %s
53*	vivadotcl2M
9synth_design -top fpga_top_module -part xc7a35ticsg324-1L2default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35ti2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35ti2default:defaultZ17-349h px? 
X
Loading part %s157*device2%
xc7a35ticsg324-1L2default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
139602default:defaultZ8-7075h px? 
?
.identifier '%s' is used before its declaration4750*oasys2

sync_rst_n2default:default2R
<C:/Users/gy400/Documents/CORDIC/hdl/utils/fpga_top_module.sv2default:default2
242default:default8@Z8-6901h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1005.688 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2#
fpga_top_module2default:default2
 2default:default2R
<C:/Users/gy400/Documents/CORDIC/hdl/utils/fpga_top_module.sv2default:default2
112default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
	clk_wiz_02default:default2
 2default:default2?
}C:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.runs/synth_1/.Xil/Vivado-13656-DESKTOP-L5PSEKK/realtime/clk_wiz_0_stub.v2default:default2
52default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	clk_wiz_02default:default2
 2default:default2
12default:default2
12default:default2?
}C:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.runs/synth_1/.Xil/Vivado-13656-DESKTOP-L5PSEKK/realtime/clk_wiz_0_stub.v2default:default2
52default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

top_module2default:default2
 2default:default2M
7C:/Users/gy400/Documents/CORDIC/hdl/utils/top_module.sv2default:default2
112default:default8@Z8-6157h px? 
e
%s
*synth2M
9	Parameter CLK_FREQ bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter BAUD_RATE bound to: 3000000 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
uart_rx2default:default2
 2default:default2J
4C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_rx.sv2default:default2
102default:default8@Z8-6157h px? 
i
%s
*synth2Q
=	Parameter CLK_FREQ_MHZ bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter BAUD_RATE bound to: 3000000 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter OVERSAMPLE_RATE bound to: 16 - type: integer 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter NUM_DATA_BITS bound to: 8 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter PARITY_ON bound to: 1 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter PARITY_EO bound to: 1 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter EVEN_PAR bound to: 0 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter ODD_PAR bound to: 1 - type: integer 
2default:defaulth p
x
? 
j
%s
*synth2R
>	Parameter OVERSAMP_PULSEGEN_MAX bound to: 2 - type: integer 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter OVERSAMP_CNT_MAX bound to: 16 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_rx2default:default2
 2default:default2
22default:default2
12default:default2J
4C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_rx.sv2default:default2
102default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
uart_rx_msg2default:default2
 2default:default2N
8C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_rx_msg.sv2default:default2
142default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
lfsr2default:default2
 2default:default2G
1C:/Users/gy400/Documents/CORDIC/hdl/utils/lfsr.sv2default:default2
112default:default8@Z8-6157h px? 
V
%s
*synth2>
*	Parameter N bound to: 8 - type: integer 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter poly bound to: 8'b10011011 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
lfsr2default:default2
 2default:default2
32default:default2
12default:default2G
1C:/Users/gy400/Documents/CORDIC/hdl/utils/lfsr.sv2default:default2
112default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_rx_msg2default:default2
 2default:default2
42default:default2
12default:default2N
8C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_rx_msg.sv2default:default2
142default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2!
cordic_sincos2default:default2
 2default:default2X
BC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos.sv2default:default2
112default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter STAGES bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2'
cordic_sincos_stage2default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 0 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
cordic_sincos_stage2default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized02default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 1 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized02default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized12default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 2 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized12default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized22default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized22default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized32default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized32default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized42default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 5 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized42default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized52default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized52default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized62default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 7 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized62default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized72default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized72default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized82default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter STAGE bound to: 9 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized82default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys27
#cordic_sincos_stage__parameterized92default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys27
#cordic_sincos_stage__parameterized92default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized102default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 11 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized102default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized112default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 12 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized112default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized122default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 13 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized122default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized132default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 14 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized132default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized142default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 15 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized142default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized152default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 16 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized152default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized162default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 17 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized162default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized172default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 18 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized172default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized182default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 19 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized182default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized192default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 20 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized192default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized202default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 21 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized202default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized212default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 22 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized212default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized222default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 23 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized222default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized232default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 24 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized232default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized242default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 25 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized242default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized252default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 26 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized252default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized262default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 27 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized262default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized272default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 28 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized272default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized282default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 29 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized282default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized292default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 30 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized292default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized302default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 31 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized302default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized312default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized312default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized322default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 33 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized322default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized332default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 34 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized332default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized342default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 35 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized342default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized352default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 36 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized352default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized362default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 37 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized362default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized372default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 38 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized372default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized382default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 39 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized382default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized392default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 40 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized392default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized402default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 41 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized402default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized412default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 42 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized412default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized422default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 43 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized422default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized432default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 44 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized432default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized442default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 45 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized442default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized452default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 46 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized452default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys28
$cordic_sincos_stage__parameterized462default:default2
 2default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter STAGE bound to: 47 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$cordic_sincos_stage__parameterized462default:default2
 2default:default2
52default:default2
12default:default2^
HC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_stage.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2,
cordic_sincos_preprocess2default:default2
 2default:default2c
MC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_preprocess.sv2default:default2
122default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter STAGES bound to: 48 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter BITS bound to: 48 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
cordic_sincos_preprocess2default:default2
 2default:default2
62default:default2
12default:default2c
MC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos_preprocess.sv2default:default2
122default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
cordic_sincos2default:default2
 2default:default2
72default:default2
12default:default2X
BC:/Users/gy400/Documents/CORDIC/hdl/cordic_sincos/cordic_sincos.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
uart_tx_msg2default:default2
 2default:default2N
8C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_tx_msg.sv2default:default2
132default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_tx_msg2default:default2
 2default:default2
82default:default2
12default:default2N
8C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_tx_msg.sv2default:default2
132default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	sync_fifo2default:default2
 2default:default2L
6C:/Users/gy400/Documents/CORDIC/hdl/utils/sync_fifo.sv2default:default2
112default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter DEPTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter ADDR_WIDTH bound to: 6 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
bram2default:default2
 2default:default2G
1C:/Users/gy400/Documents/CORDIC/hdl/utils/bram.sv2default:default2
102default:default8@Z8-6157h px? 
_
%s
*synth2G
3	Parameter ADDR_WIDTH bound to: 6 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter DEPTH bound to: 64 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
bram2default:default2
 2default:default2
92default:default2
12default:default2G
1C:/Users/gy400/Documents/CORDIC/hdl/utils/bram.sv2default:default2
102default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	sync_fifo2default:default2
 2default:default2
102default:default2
12default:default2L
6C:/Users/gy400/Documents/CORDIC/hdl/utils/sync_fifo.sv2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
uart_tx2default:default2
 2default:default2J
4C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_tx.sv2default:default2
102default:default8@Z8-6157h px? 
i
%s
*synth2Q
=	Parameter CLK_FREQ_MHZ bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter BAUD_RATE bound to: 3000000 - type: integer 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter NUM_DATA_BITS bound to: 8 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter PARITY_ON bound to: 1 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter PARITY_EO bound to: 1 - type: integer 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter NUM_STOP_BITS bound to: 1 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter EVEN_PAR bound to: 0 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter ODD_PAR bound to: 1 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter BAUDPER_CNT_MAX bound to: 33 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_tx2default:default2
 2default:default2
112default:default2
12default:default2J
4C:/Users/gy400/Documents/CORDIC/hdl/utils/uart_tx.sv2default:default2
102default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

top_module2default:default2
 2default:default2
122default:default2
12default:default2M
7C:/Users/gy400/Documents/CORDIC/hdl/utils/top_module.sv2default:default2
112default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
fpga_top_module2default:default2
 2default:default2
132default:default2
12default:default2R
<C:/Users/gy400/Documents/CORDIC/hdl/utils/fpga_top_module.sv2default:default2
112default:default8@Z8-6155h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1005.688 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1005.688 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1005.688 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.4072default:default2
1005.6882default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
rc:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2$
clk_wiz_0_inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
rc:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2default:default2$
clk_wiz_0_inst	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2o
YC:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.srcs/constrs_1/new/cordic_sincos.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2o
YC:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.srcs/constrs_1/new/cordic_sincos.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2m
YC:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.srcs/constrs_1/new/cordic_sincos.xdc2default:default25
!.Xil/fpga_top_module_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1111.9532default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0642default:default2
1111.9532default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Loading part: xc7a35ticsg324-1L
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
uart_rx2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2"
lfsr_state_reg2default:default2
uart_rx_msg2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2%
cmd_seq_state_reg2default:default2
uart_rx_msg2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2"
lfsr_state_reg2default:default2
uart_tx_msg2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
tx_msg_state_reg2default:default2
uart_tx_msg2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
uart_tx2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                RX_START |                               00 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_                 RX_DATA |                               01 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_               RX_PARITY |                               10 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 RX_STOP |                               11 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2

sequential2default:default2
uart_rx2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_         LFSR_STATE_LOAD |                                0 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_        LFSR_STATE_COUNT |                                1 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
lfsr_state_reg2default:default2

sequential2default:default2
uart_rx_msg2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_            STATE_HEADER |                             0000 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_               STATE_CMD |                             0001 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_      STATE_SINGLE_TRANS |                             0010 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_       STATE_BURST_TRANS |                             0011 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2s
_    STATE_BURST_TRANS_II |                             0100 | 00000000000000000000000000000100
2default:defaulth p
x
? 
?
%s
*synth2s
_           STATE_DISABLE |                             0101 | 00000000000000000000000000000101
2default:defaulth p
x
? 
?
%s
*synth2s
_            STATE_ENABLE |                             0110 | 00000000000000000000000000000110
2default:defaulth p
x
? 
?
%s
*synth2s
_         STATE_CRC_CHECK |                             0111 | 00000000000000000000000000000111
2default:defaulth p
x
? 
?
%s
*synth2s
_      STATE_CRC_CHECK_II |                             1000 | 00000000000000000000000000001000
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2%
cmd_seq_state_reg2default:default2

sequential2default:default2
uart_rx_msg2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_         LFSR_STATE_LOAD |                              001 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_        LFSR_STATE_COUNT |                              010 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_               LFSR_DONE |                              100 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
lfsr_state_reg2default:default2
one-hot2default:default2
uart_tx_msg2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_              STATE_IDLE |                             0000 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_       STATE_BURST_TRANS |                             0001 | 00000000000000000000000000000100
2default:defaulth p
x
? 
?
%s
*synth2s
_      STATE_SINGLE_TRANS |                             0010 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_   STATE_SINGLE_TRANS_II |                             0011 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_  STATE_SINGLE_TRANS_III |                             0100 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2s
_    STATE_BURST_TRANS_II |                             0101 | 00000000000000000000000000000101
2default:defaulth p
x
? 
?
%s
*synth2s
_   STATE_BURST_TRANS_III |                             0110 | 00000000000000000000000000000110
2default:defaulth p
x
? 
?
%s
*synth2s
_     STATE_BURST_TRANS_V |                             0111 | 00000000000000000000000000001000
2default:defaulth p
x
? 
?
%s
*synth2s
_    STATE_BURST_TRANS_IV |                             1000 | 00000000000000000000000000000111
2default:defaulth p
x
? 
?
%s
*synth2s
_           STATE_DISABLE |                             1001 | 00000000000000000000000000001001
2default:defaulth p
x
? 
?
%s
*synth2s
_        STATE_DISABLE_II |                             1010 | 00000000000000000000000000001010
2default:defaulth p
x
? 
?
%s
*synth2s
_            STATE_ENABLE |                             1011 | 00000000000000000000000000001011
2default:defaulth p
x
? 
?
%s
*synth2s
_         STATE_ENABLE_II |                             1100 | 00000000000000000000000000001100
2default:defaulth p
x
? 
?
%s
*synth2s
_           STATE_TX_CRC8 |                             1101 | 00000000000000000000000000001101
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
tx_msg_state_reg2default:default2

sequential2default:default2
uart_tx_msg2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                 TX_IDLE |                           000001 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_             TX_GET_DATA |                           000010 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_                TX_START |                           000100 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 TX_DATA |                           001000 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2s
_               TX_PARITY |                           010000 | 00000000000000000000000000000100
2default:defaulth p
x
? 
?
%s
*synth2s
_                 TX_STOP |                           100000 | 00000000000000000000000000000101
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2
uart_tx2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:26 ; elapsed = 00:00:26 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   48 Bit       Adders := 242   
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   48 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit         XORs := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Wide XORs := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               48 Bit    Registers := 147   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 25    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 116   
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
h
%s
*synth2P
<	              512 Bit	(64 X 8 bit)          RAMs := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   48 Bit        Muxes := 98    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input   48 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   47 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   46 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   45 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   44 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   43 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   42 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   41 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   40 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   39 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   38 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   37 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   36 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   35 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   34 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   33 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   31 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   30 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   29 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   28 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   27 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   26 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   25 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   23 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   22 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   21 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   20 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   19 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   18 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   17 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   15 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   13 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   11 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 6     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  14 Input    8 Bit        Muxes := 14    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    6 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 11    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    4 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  14 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 36    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 6     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   9 Input    1 Bit        Muxes := 10    
2default:defaulth p
x
? 
X
%s
*synth2@
,	  14 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 7     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:49 ; elapsed = 00:00:50 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping	Report (see note below)
2default:defaulth px? 
?
%s*synth2?
t+----------------+----------------------------------+-----------+----------------------+--------------------------+
2default:defaulth px? 
?
%s*synth2?
u|Module Name     | RTL Object                       | Inference | Size (Depth x Width) | Primitives               | 
2default:defaulth px? 
?
%s*synth2?
t+----------------+----------------------------------+-----------+----------------------+--------------------------+
2default:defaulth px? 
?
%s*synth2?
u|fpga_top_module | sync_fifo_inst/bram_inst/mem_reg | Implied   | 64 x 8               | RAM64X1D x 2	RAM64M x 2	 | 
2default:defaulth px? 
?
%s*synth2?
u+----------------+----------------------------------+-----------+----------------------+--------------------------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:58 ; elapsed = 00:00:59 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:01:01 ; elapsed = 00:01:02 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
S
%s
*synth2;
'
Distributed RAM: Final Mapping	Report
2default:defaulth p
x
? 
?
%s
*synth2?
t+----------------+----------------------------------+-----------+----------------------+--------------------------+
2default:defaulth p
x
? 
?
%s
*synth2?
u|Module Name     | RTL Object                       | Inference | Size (Depth x Width) | Primitives               | 
2default:defaulth p
x
? 
?
%s
*synth2?
t+----------------+----------------------------------+-----------+----------------------+--------------------------+
2default:defaulth p
x
? 
?
%s
*synth2?
u|fpga_top_module | sync_fifo_inst/bram_inst/mem_reg | Implied   | 64 x 8               | RAM64X1D x 2	RAM64M x 2	 | 
2default:defaulth p
x
? 
?
%s
*synth2?
u+----------------+----------------------------------+-----------+----------------------+--------------------------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:01:10 ; elapsed = 00:01:11 . Memory (MB): peak = 1111.953 ; gain = 106.266
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:01:15 ; elapsed = 00:01:17 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:01:16 ; elapsed = 00:01:17 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:19 ; elapsed = 00:01:20 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:01:19 ; elapsed = 00:01:20 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:01:19 ; elapsed = 00:01:20 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:01:19 ; elapsed = 00:01:20 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23

Static Shift Register Report:
2default:defaulth p
x
? 
?
%s
*synth2?
?+----------------+------------------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|Module Name     | RTL Name                                                                                 | Length | Width | Reset Signal | Pull out first Reg | Pull out last Reg | SRL16E | SRLC32E | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+----------------+------------------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[23].cordic_inst_i/o_theta_reg[21] | 9      | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[22].cordic_inst_i/o_theta_reg[22] | 8      | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[21].cordic_inst_i/o_theta_reg[23] | 7      | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[20].cordic_inst_i/o_theta_reg[24] | 6      | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[19].cordic_inst_i/o_theta_reg[25] | 5      | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[18].cordic_inst_i/o_theta_reg[26] | 4      | 2     | YES          | NO                 | YES               | 2      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[47].cordic_inst_i/o_valid_reg     | 50     | 1     | YES          | NO                 | YES               | 0      | 2       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[46].cordic_inst_i/o_sign_reg      | 47     | 1     | YES          | NO                 | YES               | 0      | 2       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[44].cordic_inst_i/o_theta_reg[0]  | 30     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[43].cordic_inst_i/o_theta_reg[1]  | 29     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[42].cordic_inst_i/o_theta_reg[2]  | 28     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[41].cordic_inst_i/o_theta_reg[3]  | 27     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[40].cordic_inst_i/o_theta_reg[4]  | 26     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[39].cordic_inst_i/o_theta_reg[5]  | 25     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[38].cordic_inst_i/o_theta_reg[6]  | 24     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[37].cordic_inst_i/o_theta_reg[7]  | 23     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[36].cordic_inst_i/o_theta_reg[8]  | 22     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[35].cordic_inst_i/o_theta_reg[9]  | 21     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[34].cordic_inst_i/o_theta_reg[10] | 20     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[33].cordic_inst_i/o_theta_reg[11] | 19     | 1     | YES          | NO                 | YES               | 0      | 1       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[32].cordic_inst_i/o_theta_reg[12] | 18     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[31].cordic_inst_i/o_theta_reg[13] | 17     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[30].cordic_inst_i/o_theta_reg[14] | 16     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[29].cordic_inst_i/o_theta_reg[15] | 15     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[28].cordic_inst_i/o_theta_reg[16] | 14     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[27].cordic_inst_i/o_theta_reg[17] | 13     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[26].cordic_inst_i/o_theta_reg[18] | 12     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[25].cordic_inst_i/o_theta_reg[19] | 11     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|fpga_top_module | top_module_inst/cordic_sincos_module/CORDIC_STAGES_GEN[24].cordic_inst_i/o_theta_reg[20] | 10     | 1     | YES          | NO                 | YES               | 1      | 0       | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+----------------+------------------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |clk_wiz_0     |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|1     |clk_wiz  |     1|
2default:defaulth px? 
F
%s*synth2.
|2     |CARRY4   |  2803|
2default:defaulth px? 
F
%s*synth2.
|3     |LUT1     |  4931|
2default:defaulth px? 
F
%s*synth2.
|4     |LUT2     |  4006|
2default:defaulth px? 
F
%s*synth2.
|5     |LUT3     |   288|
2default:defaulth px? 
F
%s*synth2.
|6     |LUT4     |  2328|
2default:defaulth px? 
F
%s*synth2.
|7     |LUT5     |   129|
2default:defaulth px? 
F
%s*synth2.
|8     |LUT6     |   124|
2default:defaulth px? 
F
%s*synth2.
|9     |MUXF7    |     1|
2default:defaulth px? 
F
%s*synth2.
|10    |RAM64M   |     2|
2default:defaulth px? 
F
%s*synth2.
|11    |RAM64X1D |     2|
2default:defaulth px? 
F
%s*synth2.
|12    |SRL16E   |    16|
2default:defaulth px? 
F
%s*synth2.
|13    |SRLC32E  |    16|
2default:defaulth px? 
F
%s*synth2.
|14    |FDCE     |     4|
2default:defaulth px? 
F
%s*synth2.
|15    |FDRE     |  6785|
2default:defaulth px? 
F
%s*synth2.
|16    |FDSE     |     4|
2default:defaulth px? 
F
%s*synth2.
|17    |IBUF     |     2|
2default:defaulth px? 
F
%s*synth2.
|18    |OBUF     |     5|
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:01:19 ; elapsed = 00:01:20 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:01:02 ; elapsed = 00:01:14 . Memory (MB): peak = 1124.680 ; gain = 12.727
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:01:19 ; elapsed = 00:01:21 . Memory (MB): peak = 1124.680 ; gain = 118.992
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.5272default:default2
1136.7342default:default2
0.0002default:defaultZ17-268h px? 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
28082default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
g
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
12default:defaultZ31-140h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0072default:default2
1151.6212default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 4 instances were transformed.
  RAM64M => RAM64M (RAMD64E(x4)): 2 instances
  RAM64X1D => RAM64X1D (RAMD64E(x2)): 2 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1482default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:342default:default2
00:01:382default:default2
1151.6212default:default2
145.9342default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2i
UC:/Users/gy400/Documents/CORDIC/vivado/cordic_sincos.runs/synth_1/fpga_top_module.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
tExecuting : report_utilization -file fpga_top_module_utilization_synth.rpt -pb fpga_top_module_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Apr  1 18:43:30 20212default:defaultZ17-206h px? 


End Record