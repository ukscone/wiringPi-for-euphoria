include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_pcf8574Setup = define_c_func(wiringPi, "pcf8574Setup", {C_INT,C_INT},C_INT)

global function pcf8574Setup(integer pinBase, integer i2cAddress)
    return c_func(x_pcf8574Setup,{pinBase, i2cAddress})
end function
