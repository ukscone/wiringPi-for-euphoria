include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_max31855Setup = define_c_func(wiringPi, "max31855Setup", {C_INT,C_INT},C_INT)

global function max31855Setup(integer pinBase, integer spiChannel)
    return c_func(x_sr595Setup,{pinBase, spiChannel})
end function


