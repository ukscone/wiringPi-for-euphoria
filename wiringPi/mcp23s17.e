include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_mcp23s17Setup = define_c_func(wiringPi, "mcp23s17Setup", {C_INT,C_INT,C_INT},C_INT)

global function mcp23s17Setup(integer pinBase, integer spiPort, integer devId)
    return c_func(x_mcp23s17Setup,{pinBase, spiPort, devId})
end function


