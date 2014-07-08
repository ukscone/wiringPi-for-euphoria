include std/dll.e
atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

global constant MAX_LCDS=8

constant x_lcdHome = define_c_proc(wiringPi, "lcdHome", {C_INT}),
	 x_lcdClear = define_c_proc(wiringPi, "lcdClear", {C_INT}),
	 x_lcdSendCommand = define_c_proc(wiringPi, "lcdSendCommand", {C_INT, C_UINT}),
	 x_lcdPosition = define_c_proc(wiringPi, "lcdPosition", {C_INT, C_INT, C_INT}),
	 x_lcdPutchar = define_c_proc(wiringPi, "lcdPutchar", {C_INT, C_POINTER}),
	 x_lcdPuts = define_c_proc(wiringPi, "lcdPuts", {C_INT, C_POINTER}),
	x_lcdPrintf = define_c_proc(wiringPi, "lcdPrintf", {C_INT, C_POINTER})

global procedure lcdHome(integer fd)
	c_proc(x_lcdHome, fd)
end procedure

global procedure lcdClear(integer fd)
	c_proc(x_lcdClear, fd)
end procedure

global procedure lcdSendComand(integer fd, atom command)
	c_proc(x_lcdSendCommand, {fd, command})
end procedure

global procedure lcdPosition(integer fd, integer x, integer y)
	c_proc(x_lcdPosition, {fd,x,y})
end procedure

global procedure lcdPutchar(integer fd, atom data)
	c_proc(x_lcdPutchar,{fd, data})
end procedure

global procedure lcdPuts(integer fd, atom string)
	c_proc(x_lcdPuts,{fd, string})
end procedure

global procedure lcdPrintf(integer fd, atom message)
	c_proc(x_lcdPrintf,{fd, message})
end procedure

constant x_lcdInit = define_c_func(wiringPi, "lcdInit", {C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT},C_INT)

global function lcd_Init(integer rows, integer cols, integer bits, integer rs, integer strb,
        integer d0, integer d1, integer d2, integer d3, integer d4, integer d5, integer d6, integer d7) 
	return c_func(x_lcdInit, {rows, cols, bits, rs, strb,d0,d1,d2,d3,d4,d5,d6,d7})
end function

