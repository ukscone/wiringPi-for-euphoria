include std/dll.e
atom wiringPiDev
wiringPiDev = open_dll({"libwiringPiDev.so", "libwiringPiDev.so.2.0"})

constant x_ds1302rtcRead = define_c_func(wiringPiDev, "ds1302rtcRead", {C_INT}, C_UINT)

global function ds1302rtcRead(integer reg)
    return c_func(x_ds1302rtcRead,{reg})
end function

constant x_ds1302rtcWrite = define_c_proc(wiringPiDev, "ds1302rtcWrite", {C_INT, C_UINT})

global procedure ds1302rtcWrite(integer reg, integer data)
    c_proc(x_ds1302rtcWrite, {reg, data})
end procedure

constant x_ds1302ramRead = define_c_func(wiringPiDev, "ds1302ramRead", {C_INT},C_UINT)

global function ds1302ramRead(integer addr)
    return c_func(x_ds1302ramRead, {addr})
end function

constant x_ds1302ramWrite = define_c_proc(wiringPiDev, "ds1302ramWrite", {C_INT, C_UINT})

global procedure ds1302ramWrite(integer addr, integer data)
    c_proc(x_ds1302ramWrite, {addr, data})
end procedure

constant x_ds1302trickleCharge = define_c_proc(wiringPiDev, "ds1302trickleCharge", {C_INT, C_INT})

global procedure ds1302trickleCharge(integer diodes, integer resistors)
    c_proc(x_ds1302trickleCharge, {diodes, resistors})
end procedure

constant x_ds1302setup = define_c_proc(wiringPiDev, "ds1302setup", {C_INT, C_INT,C_INT})

global procedure ds1302setup(integer clockPin, integer dataPin, integer csPin)
    c_proc(x_ds1302setup, {clockPin, dataPin, csPin})
end procedure

constant x_ds1302clockRead = define_c_proc(wiringPiDev, "ds1302clockRead",{C_POINTER})
--int clockData [8]

constant x_ds1302clockWrite = define_c_proc(wiringPiDev, "ds1302clockWrite", {C_POINTER})
--(const int clockData [8]) ;

