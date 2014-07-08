include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_pcf23017Setup = define_c_func(wiringPi, "pcf23017Setup", {C_INT,C_INT},C_INT)

global function pcf23017Setup(integer pinBase, integer i2cAddress)
    return c_func(x_pcf23017Setup,{pinBase, i2cAddress})
end function


