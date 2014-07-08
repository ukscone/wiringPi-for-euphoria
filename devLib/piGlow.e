include std/dll.e
include std/os.e

atom wiringPiDev
wiringPiDev = open_dll({"libwiringPiDev.so", "libwiringPiDev.so.2.0"})

global constant PIGLOW_RED = 0
global constant PIGLOW_YELLOW = 1
global constant PIGLOW_ORANGE = 2
global constant PIGLOW_GREEN =	3
global constant PIGLOW_BLUE =	4
global constant PIGLOW_WHITE =	5

constant x_piGlow1 = define_c_proc(wiringPiDev, "piGlow1", {C_INT, C_INT, C_INT})
constant x_piGlowLeg = define_c_proc(wiringPiDev, "piGlowLeg",{C_INT,C_INT})
constant x_piGlowRing = define_c_proc(wiringPiDev, "piGlowRing", {C_INT,C_INT})
constant x_piGlowSetup = define_c_proc(wiringPiDev, "piGlowSetup",{C_INT})

global procedure piGlow1(integer leg, integer ring, integer intensity)
    c_proc(x_piGlow1,{leg, ring, intensity})
end procedure

global procedure piGlowLeg(integer leg, integer intensity)
    c_proc(x_piGlowLeg, {leg, intensity})
end procedure

global procedure piGlowRing(integer ring, integer intensity)
    c_proc(x_piGlowRing, {ring, intensity})
end procedure

global procedure piGlowSetup(integer clear)
    c_proc(x_piGlowSetup, {clear})
end procedure

------------------------------------------------
-- helper func & procs
------------------------------------------------

global procedure piGlowReset()
    piGlowLeg(0,0)
    piGlowLeg(1,0)
    piGlowLeg(2,0)
end procedure

global procedure piGlowRingIn(atom delay)
    for j = PIGLOW_RED to PIGLOW_WHITE do
        piGlowRing(j,255)
        sleep(delay)
        piGlowRing(j,0)
    end for
end procedure

global procedure piGlowRingOut(atom delay)
    for j = PIGLOW_WHITE to PIGLOW_RED by -1 do
        piGlowRing(j,255)
        sleep(delay)
        piGlowRing(j,0)
    end for
end procedure
 
