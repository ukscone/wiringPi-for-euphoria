include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_sr595Setup = define_c_func(wiringPi, "sr595Setup", {C_INT,C_INT,C_INT,C_INT,C_INT},C_INT)

global function sr595Setup(integer pinBase, integer numPins, integer dataPin, integer clockPin, integer latchPin)
    return c_func(x_sr595Setup,{pinBase, numPins, datapin, clockpin, latchPin})
end function

