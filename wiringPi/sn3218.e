include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_sn3218Setup = define_c_func(wiringPi, "sn3218Setup", {C_INT},C_INT)

global function sn3218Setup(integer pinBase)
    return c_func(x_sr595Setup,{pinBase})
end function

