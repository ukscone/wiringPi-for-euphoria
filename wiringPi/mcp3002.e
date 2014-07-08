include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_mcp3002Setup = define_c_func(wiringPi, "mcp3002Setup", {C_INT,C_INT},C_INT)

global function mcp3002Setup(integer pinBase, integer spiChannel)
    return c_func(x_mcp3002Setup,{pinBase, spiChannel})
end function

