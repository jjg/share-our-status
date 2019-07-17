# Share Our Status Development Journal

## 07112019

Initial project discussion based on previous conversations about ways to indicate to others if you are doing something important on your phone or if you are just screwing around and can be interrupted.  We quickly iterated over several designs and settled on something akin to a ["pop socket"]() that attaches to the back of the phone and indicates status using a red/green light.

Designed a proof-of-concept hardware implementation that is unweildly, but should be sufficient to carry-out field studies and answer design questions on both the hardware and software sides.

The PoC hardware consists of:

* Adafruit Gemma M0 
* 2x 3.0v lithium coin cell battery
* Copper disc capacitive touch sensor
* 3D-printed case
* Laser-engraved & cut acrylic diffuser

The Gemma M0 is overkill for this application but it was selected for the PoC due to its form factor, the inclusion of all hardware features (RGB LED, capacitive touch sensor, etc.) and the fact that it runs [CircuitPython]() which makes iterating on the firmware much easier than the alternatives.

The final design will likely use much more primative and less expensive hardware (possibly just two LED's and discrete logic) but for now the flexibility of a full-blown microcontroller saves time and allows for a lot of experimentation.

The initial behavior of the device is described as such:

1. When the device is "opened", it powers-up and displays a green light
2. If tapped once, the light turns red
3. The light remains red unless it is tapped again, the device is "closed" or a preset maximum amount of "busy time" is reached
4. When the device is closed, it is powered-down

Hardware-wise the power-up and power-down events are handled by mechanically breaking the power supply circuit between the mcu and the battery.  This minimizes power draw as opposed to using "soft" switches and low-power modes.

Taps are detected using capacitive touch while the device is powered-up.

The single RGB LED on the Gemma M0 is diffused using a laser-engraved piece of clear acrylic disc.

## 07122019

Began this journal.

## 07172019

Lots going on now so I'm not sure how much time we'll have to work on this over the next few weeks, but maybe we can at least get the first iteration of a PoC built.

A first pass at a 3D-printable case has been added to this repository.  It's pretty big, probably too big for even basic testing but after fitting the Gemma M0 into it, I think we can shave a few mm off of it here and there.  I still need to pick-up some cells and add some "minerals" to the battery compartment, but assuming that works as designed the only remaing chassis part to design is the diffuser.

I think the diffuser can be laser cut from 1mm clear acrylic and then engraved to diffuse the LED's light.  I've also read that capacitive touch sensing can work *through* this sort of acrylic so the plan for now is to put the sensor surface on the inside of this piece.  Copper foil tape is recommended here, but we'll see what I can scrounge-up in the time available.

I think the diffuser can be snap-fit into the 3D printed part for now, or even taped.  In the long run something better will need to be implemented to facilitate changing batteries, etc.  I also plan to leave-out the automatic power-up/down feature in this iteration to keep things simple, and becaus this will change a lot down the road.

It's becoming clear that between the power supply requirements (>3vdc) as well as the physical size and cost of the Gemma M0 will probably make it impractical past the PoC phase of the project.  I really like the flexibility a microcontoller provides, but realisticaly the device could probably work just as well using a single cell, two LED's and some kind of IC logic.  That said I'll probably stick to the M0 until we do some testing and determine the best balance of the various variables, and I'm not completely ruling-out using a microcontroller in the final product if I can find one that meets all the requirements better than the M0.
