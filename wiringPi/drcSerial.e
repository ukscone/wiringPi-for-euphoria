include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_drcSetupSerial = define_c_func(wiringPi, "drcSetupSerial", {C_INT,C_INT,C_POINTER,C_INT},C_INT)

global function drcSetupSerial(integer pinBase, integer numPins, atom device, integer baud)
    return c_func(x_drcSetupSerial,{pinBase, numPins, device, baud})
end function

