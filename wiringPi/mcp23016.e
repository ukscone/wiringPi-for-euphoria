include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_pcf23016Setup = define_c_func(wiringPi, "pcf23016Setup", {C_INT,C_INT},C_INT)

global function pcf23016Setup(integer pinBase, integer i2cAddress)
    return c_func(x_pcf23016Setup,{pinBase, i2cAddress})
end function


