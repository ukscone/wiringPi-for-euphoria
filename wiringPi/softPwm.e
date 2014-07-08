include std/dll.e
atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_softPwmCreate = define_c_func(wiringPi,"softPwmCreate",{C_INT, C_INT, C_INT}, C_INT),
	 x_softPwmWrite = define_c_proc(wiringPi, "softPwmWrite",{C_INT, C_INT})

global function softPwmCreate(integer pin, integer value, integer range)
	 return c_func(x_softPwmCreate,{pin, value, range})
end function

global procedure softPwmWrite( integer pin, integer value)
	c_proc(x_softPwmWrite, {pin, value})
end procedure

