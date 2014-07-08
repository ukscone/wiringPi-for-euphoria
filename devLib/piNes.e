include std/dll.e
atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

global constant MAX_NES_JOYSTICKS=8
global constant NES_RIGHT=0x01
global constant NES_LEFT=0x02
global constant NES_DOWN=0x04
global constant NES_UP=0x08
global constant NES_START=0x10
global constant NES_SELECT=0x20
global constant NES_B=0x40
global constant NES_A=0x80

constant x_setupNesJoystick = define_c_func(wiringPi, "setupNesJoystick", {C_INT, C_INT, C_INT}, C_INT),
         x_readNesJoystick = define_c_func(wiringPi, "readNesJoystick", {C_INT}, C_UINT)

global function setupNesJoystick(integer dPin, integer cPin, integer lPin)
         return c_func(x_setupNesJoystick, {dPin, cPin, lPin})
end function

global function readNesJoystick(integer joystick)
         return c_func(x_readNesJoystick,{joystick})
end function
