include std/dll.e

atom wiringPI
wiringPI = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

global constant	LSBFIRST=0
global constant	MSBFIRST=1

constant x_shiftIn = define_c_func(wiringPI, "shiftIn", {C_INT, C_INT, C_INT}, C_INT),
	 x_shiftOut = define_c_proc(wiringPI, "shiftOut", {C_INT,C_INT,C_INT,C_INT)

global function shiftIn(integer dPin, integer cPin, integer order)
	return c_func(x_shiftIn,{dPin,cPin,order})
end function

global procedure shiftOut(integer dPin, integer cPin, integer order, integer val)
	c_proc(x_shiftOut,{dPin,cPin,order,val)
end procedure

