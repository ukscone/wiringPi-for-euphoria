include ../wiringPi/wiringPi.e
include ../devLib/piGlow.e

wiringPiSetup()

piGlowSetup(1)

for i = 0  to 20 do
   piGlowRingIn(0.1)
end for

for i = 0 to 20 do
    piGlowRingOut(0.1)
end for

for i = 0 to 2 do
    for j = PIGLOW_RED to PIGLOW_WHITE do
        piGlow1(i,j,255)
        delay(500)
        piGlow1(i,j,0)
    end for
end for 

for j = 0 to 10 do
    for i = 0 to 2 do
        piGlowLeg(i,255)
        delayMicroseconds(1000000)
        piGlowLeg(i,0)
    end for
end for

