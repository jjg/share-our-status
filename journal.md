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
