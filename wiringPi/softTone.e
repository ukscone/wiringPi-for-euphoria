include std/dll.e

atom wiringPi

wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_softToneCreate = define_c_func(wiringPi, "softToneCreate", {C_INT}, C_INT), 
	 x_softToneWrite = define_c_proc(wiringPi, "softToneWrite", {C_INT, C_INT})

global function softToneCreate(integer pin)
	 return c_func(x_softToneCreate,{pin})
end function

global procedure softToneWrite( integer pin, integer freq)
	 c_proc(x_softToneWrite,{pin, freq})
end procedure

