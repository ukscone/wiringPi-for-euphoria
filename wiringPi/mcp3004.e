include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_mcp3004Setup = define_c_func(wiringPi, "mcp3004Setup", {C_INT,C_INT},C_INT)

global function mcp3004Setup(integer pinBase, integer spiChannel)
    return c_func(x_mcp3004Setup,{pinBase, spiChannel})
end function

