include std/dll.e
atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_softServoWrite = define_c_proc(wiringPi, "softServoWrite", {C_INT, C_INT}),
	 x_softServoSetup = define_c_func(wiringPi, "softServoSetup", {C_INT, C_INT,C_INT, C_INT,C_INT, C_INT,C_INT, C_INT},C_INT)

global procedure softServoWrite(integer pin, integer value)
	c_proc(x_softServoWrite,{pin, value})
end procedure

global function softServoSetup(integer p0, integer p1, integer p2, integer p3, integer p4, integer p5, integer p6, integer p7)
	return c_func(x_softServoSetup,{p0,p1,p2,p3,p4,p5,p6,p7})
end function

