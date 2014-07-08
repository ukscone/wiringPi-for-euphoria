include std/dll.e

atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_wiringPiSPIGetFd = define_c_func(wiringPi, "wiringPiSPIFd", {C_INT},C_INT),
	x_wiringPiSPIDataRW = define_c_func(wiringPi, "wiringPiSPIDataRaw", {C_INT, C_POINTER, C_INT},C_INT),
	x_wiringPiSPISetup = define_c_func(wiringPi, "wiringPiSPISetup", {C_INT, C_INT}, C_INT)

global function wiringPiSPIGetFd( integer channel)
	return c_func(x_wiringPiSPIGetFd, {channel})
end function

global function wiringPiSPIDataRW(integer channel,atom data,integer len)
	return c_func(x_wiringPiSPIDataRW, {channel,data,len})
end function

global function wiringPiSPISetup(integer channel, integer speed)
	return c_func(x_wiringPiSPISetup, {channel, speed})
end function
