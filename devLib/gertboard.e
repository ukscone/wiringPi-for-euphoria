include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_gertboardAnalogWrite = define_c_proc(wiringPi, "gertboardAnalogWrite", {C_INT, C_INT}),
	 x_gertboardAnalogRead = define_c_func(wiringPi, "gertboardAnalogRead", {C_INT}, C_INT),
	 x_gertboardSPISetup = define_c_func(wiringPi, "gertboardSPISetup", {}, C_INT)

global procedure gertboardAnalogWrite(integer chan, integer value)
	c_proc(x_gertboardAnalogWrite, {chan, value})
end procedure

global function gertboardAnalogRead(integer chan)
	return c_func(x_gertboardAnalogRead, {chan})
end function

global function gertboardSPISetup()
	return c_func(x_gertboardSPISetup, {})
end function

