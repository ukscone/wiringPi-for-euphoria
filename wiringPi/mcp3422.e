include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

global constant	MCP3422_SR_3_75	0
global constant	MCP3422_SR_15	1
global constant	MCP3422_SR_60	2
global constant	MCP3422_SR_240	3

global constant	MCP3422_GAIN_1	0
global constant	MCP3422_GAIN_2	1
global constant	MCP3422_GAIN_4	2
global constant	MCP3422_GAIN_8	3

constant x_mcp3422Setup = define_c_func(wiringPi, "mcp3422Setup", {C_INT,C_INT,C_INT,C_INT},C_INT)

global function mcp3422Setup(integer pinBase, integer i2cAddress, integer sampleRate, integer gain)
    return c_func(x_mcp3422Setup,{pinBase, i2cAddress, sampleRate, gain})
end function


