inclide std/dll.e

atom wiringPiDev
wiringPiDev = open_dll({"libwiringPiDev.so", "libwiringPiDev.so.2.0"})

constant x_piFaceSetup = define_c_func(wiringPiDev, "piFaceSetup",{C_INT}, C_INT)

global function piFaceSetup(integer pinBase)
    return c_func(x_piFaceSetup,{pinBase})
end function

