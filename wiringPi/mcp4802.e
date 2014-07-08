include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_mcp4802Setup = define_c_func(wiringPi, "mcp4802Setup", {C_INT,C_INT},C_INT)

global function mcp4802Setup(integer pinBase, integer spiChannel)
    return c_func(x_mcp4802Setup,{pinBase, spiChannel})
end function

