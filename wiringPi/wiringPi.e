include std/dll.e

-- Handy defines

-- Deprecated
global constant NUM_PINS  =      17

global constant WPI_MODE_PINS =           0
global constant WPI_MODE_GPIO  =          1
global constant WPI_MODE_GPIO_SYS =       2
global constant WPI_MODE_PHYS      =      3
global constant WPI_MODE_PIFACE     =     4
global constant WPI_MODE_UNINITIALISED = -1

-- Pin modes

global constant INPUT            =        0
global constant OUTPUT            =       1
global constant PWM_OUTPUT        =       2
global constant GPIO_CLOCK        =       3
global constant SOFT_PWM_OUTPUT   =       4
global constant SOFT_TONE_OUTPUT  =       5

global constant LOW                =      0
global constant HIGH               =      1

-- Pull up/down/none

global constant PUD_OFF             =     0
global constant PUD_DOWN            =     1
global constant PUD_UP              =     2

-- PWM

global constant PWM_MODE_MS          =   0
global constant PWM_MODE_BAL         =   1

-- Interrupt levels

global constant INT_EDGE_SETUP        =  0
global constant INT_EDGE_FALLING   =     1
global constant INT_EDGE_RISING     =    2
global constant INT_EDGE_BOTH       =    3

-- Pi model types

global constant PI_MODEL_A        =      0
global constant PI_MODEL_B        =      1
global constant PI_MODEL_CM       =      2


-- Threads

--global constant PI_THREAD(X)    void *X (void *dummy)

-- Failure modes

--global constant WPI_FATAL     =  (1==1)
--global constant WPI_ALMOST    =  (1==2)


atom wiringPi
wiringPi = open_dll({"libwiringPi.so", "libwiringPi.so.2.0"})

constant x_wiringPiSetup = define_c_func(wiringPi, "wiringPiSetup", {},C_INT)
constant x_wiringPiSetupGpio = define_c_func(wiringPi, "wiringPiSetupGpio", {},C_INT)
constant x_wiringPiSetupPhys = define_c_func(wiringPi, "wiringPiSetupPhys", {},C_INT)
constant x_wiringPiSetupSys = define_c_func(wiringPi, "wiringPiSetupSys", {},C_INT)
constant x_pinModeAlt = define_c_proc(wiringPi, "pinModeAlt", {C_INT, C_INT})
constant x_pinMode = define_c_proc(wiringPi, "pinMode", {C_INT, C_INT})
constant x_pullUpDnControl = define_c_proc(wiringPi, "pullUpDnControl", {C_INT, C_INT})
constant x_digitalRead = define_c_func(wiringPi, "digitalRead", {C_INT}, C_INT)
constant x_digitalWrite = define_c_proc(wiringPi, "digitalWrite", {C_INT, C_INT})
constant x_pwmWrite = define_c_proc(wiringPi, "pwmWrite", {C_INT, C_INT})
constant x_analogRead = define_c_func(wiringPi, "analogRead", {C_INT},C_INT)
constant x_analogWrite = define_c_proc(wiringPi, "analogWrite", {C_INT, C_INT})
constant x_delay = define_c_proc(wiringPi, "delay", {C_UINT})
constant x_delayMicroseconds = define_c_proc(wiringPi, "delayMicroseconds", {C_UINT})
constant x_millis = define_c_func(wiringPi, "millis",{},C_UINT)
constant x_micros = define_c_func(wiringPi, "micros",{},C_UINT)
constant x_piBoardRev = define_c_func(wiringPi, "piBoardRev",{},C_INT)
--extern void piBoardId           (int *model, int *rev, int *mem, char **maker) ;
constant x_wpiPinToGpio = define_c_func(wiringPi, "wpiPinToGpio", {C_INT},C_INT)
constant x_physPinToGpio = define_c_func(wiringPi, "physPinToGpio", {C_INT}, C_INT)
constant x_setPadDrive = define_c_proc(wiringPi, "setPadDrive",{C_INT, C_INT})
constant x_getAlt = define_c_func(wiringPi, "getAlt", {C_INT},C_INT)
constant x_digitalWriteByte = define_c_proc(wiringPi, "digitalWriteByte",{C_INT})
constant x_pwmSetMode = define_c_proc(wiringPi, "pwmSetMode",{C_INT})
constant x_pwmSetRange = define_c_proc(wiringPi, "pwmSetRange", {C_UINT})
constant x_pwmSetClock = define_c_proc(wiringPi, "pwmSetClock", {C_INT})
constant x_gpioClockSet = define_c_proc(wiringPi, "gpioClockSet", {C_INT,C_INT})

global procedure gpioClockSet(integer pin, integer freq)
    c_proc(x_gpioClockSet, {pin, freq})
end procedure

global procedure pwmSetClock(integer divisor)
    c_proc(x_pwmSetClock, {divisor})
end procedure

global procedure pwmSetRange(integer range)
    c_proc(x_pwmSetRange, {range})
end procedure

global procedure pwmSetMode(integer mode)
    c_proc(x_pwmSetMode,{C_INT})
end procedure

global procedure digitalWriteByte(integer value)
    c_proc(x_digitalWriteByte,{value})
end procedure

global function getAlt(integer pin)
    return c_func(x_getAlt, {pin})
end function

global procedure setPadDrive(integer group, integer value)
    c_proc(x_setPadDrive,{group, value})
end procedure

global function physPinToGpio(integer physPin)
    return c_func(x_physPinToGpio,{physPin})
end function

global function wpiPinToGpio(integer wpiPin)
    return c_func(x_wpiPinToGpio, {wpiPin})
end function

global function piBoardRev()
    return c_func(x_piBoardRev, {})
end function

global function wiringPiSetup()
    return c_func(x_wiringPiSetup,{})
end function

global function wiringPiSetupGpio()
    return c_func(x_wiringPiSetupGpio,{})
end function

global function wiringPiSetupPhys()
    return c_func(x_wiringPiSetupPhys,{})
end function

global function wiringPiSetupSys()
    return c_func(x_wiringPiSetupSys,{})
end function

global procedure pinModeAlt(integer pin, integer mode)
    c_proc(x_pinModeAlt,{pin, mode})
end procedure

global procedure pinMode(integer pin, integer mode)
    c_proc(x_pinMode, {pin, mode})
end procedure

global procedure pullUpDnControl(integer pin, integer pud)
    c_proc(x_pullUpDnControl, {pin, pud})
end procedure

global function digitalRead(integer pin)
    return c_func(x_digitalRead, {pin})
end function

global procedure digitalWrite(integer pin, integer value)
    c_proc(x_digitalWrite, {pin, value})
end procedure

global procedure pwmWrite(integer pin, integer value)
    c_proc(x_pwmWrite, {pin, value})
end procedure

global function analogRead(integer pin)
    return c_func(x_analogRead, {pin})
end function

global procedure analogWrite(integer pin, integer value)
    c_proc(x_analogWrite, {pin, value})
end procedure

global procedure delay(integer howLong)
    c_proc(x_delay, {howLong})
end procedure

global procedure delayMicroseconds(integer howLong)
    c_proc(x_delayMicroseconds, {howLong})
end procedure

global function millis()
    return c_func(x_millis,{})
end function

global function micros()
    return c_func(x_micros,{})
end function

