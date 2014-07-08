include std/dll.e
atom wiringPi
wiringPi = open_dll("./libwiringPi.so.1.0")


constant x_wiringPiI2CRead = define_c_func(wiringPi, "wiringPiI2CRead", {C_INT},C_INT),
	x_wiringPiI2CReadReg8= define_c_func(wiringPi, "wiringPiI2CReadReg8", {C_INT, C_INT},C_INT),
	x_wiringPiI2CReadReg16= define_c_func(wiringPi, "wiringPiI2CReadReg16", {C_INT, C_INT},C_INT),
	x_wiringPiI2CWrite = define_c_func(wiringPi, "wiringPiI2CWrite", {C_INT, C_INT}, C_INT),
        x_wiringPiI2CWriteReg8 = define_c_func(wiringPi, "wiringPiI2CWriteReg8", {C_INT, C_INT, C_INT},C_INT),
        x_wiringPiI2CWriteReg16 = define_c_func(wiringPi, "wiringPiI2CWriteReg16", {C_INT, C_INT, C_INT},C_INT),
	x_wiringPiI2CSetup = define_c_func(wiringPi, "wiringPiI2CSetup", {C_INT}, C_INT)

global function wiringPiI2CRead(integer fd)
	return c_func(x_wiringPiI2CRead, {fd})
end function

global function wiringPiI2CReadReg8(integer fd, integer reg)
        return c_func(x_wiringPiI2CReadReg8, {fd, reg})
end function

global function wiringPiI2CReadReg16(integer fd, integer reg)
        return c_func(x_wiringPiI2CReadReg16, {fd, reg})
end function

global function wiringPiI2CWrite(integer fd, integer data)
	return c_func(x_wiringPiI2CWrite, {fd, data})
end function

global function wiringPiI2CWriteReg8(integer fd, integer reg, integer data)
        return c_func(x_wiringPiI2CWriteReg8, {fd, reg, data})
end function

global function wiringPiI2CWriteReg16(integer fd, integer reg, integer data)
        return c_func(x_wiringPiI2CWriteReg16, {fd,reg, data})
end function

global function wiringPiI2CSetup(integer devId)
	return c_func(x_wiringPiI2CSetup,{devId})
end function
