include std/dll.e
include std/machine.e

atom wiringPI
wiringPI = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_serialOpen = define_c_func(wiringPI, "serialOpen", {C_POINTER, C_INT}, C_INT),
	 x_serialClose = define_c_proc(wiringPI, "serialCLose", {C_INT}),
	 x_serialFlush = define_c_proc(wiringPI, "serialFlush", {C_INT}),
	 x_serialPutchar = define_c_proc(wiringPI, "serialPutchar", {C_INT, C_INT}),
	 x_serialPuts = define_c_proc(wiringPI, "serialPuts", {C_INT, C_POINTER}),
	 x_serialPrintf = define_c_proc(wiringPI, "serialPrintf", {C_INT, C_POINTER}),
	 x_serialDataAvail = define_c_func(wiringPI, "serialDataAvail", {C_INT},C_INT)



global function serialOpen(sequence device, integer baud)
	return c_func(x_serialOpen, {device, baud})
end function


global procedure serialClose(integer fd)
	c_proc(x_serialClose, {fd})
end procedure

global procedure serialFlush(integer fd)
	c_proc(x_serialFlush, {fd})
end procedure

global procedure serialPutchar(integer fd, integer c)
	c_proc(x_serialPutchar, {fd,c})
end procedure

global procedure serialPuts(integer fd, sequence s)
	c_proc(x_serialPuts, {fd, s})
end procedure

global procedure SerialPrintf(integer fd, sequence fmt, object args) 
	c_proc(x_serialPrintf, {fd, allocate_string(sprintf(fmt,args),1)}) 
end procedure

global function serialDataAvail(integer fd)
	return c_func(x_serialDataAvail, {fd})
end function 
