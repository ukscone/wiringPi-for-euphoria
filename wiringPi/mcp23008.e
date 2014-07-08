include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_mcp23008Setup = define_c_func(wiringPi, "mcp23008Setup", {C_INT,C_INT},C_INT)

global function mcp23008Setup(integer pinBase, integer i2cAddress)
    return c_func(x_mcp23008Setup,{pinBase, i2cAddress})
end function

