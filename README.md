# SimpleLoopAntenna

Object is to make a simple loop to track down interference using AM
demodulation on the 2 meter radio in the car.  After that, it will be
interesting to try the antenna to reach the Anoka County Radio Club repeater.
The same size antenna works well for both.

$ ./SimpleLoopFactory.pl > SimpleLoop.nec 
$ xnec2c SimpleLoop.nec &

From http://www.66pacific.com/calculators/full-wave-loop-antenna-calculator.aspx for 146.670 MHz
  Length of full-wave loop:
  * 6 feet, 10.2 inches
  * 2.09 meters

  The calculated length is approximate. In practice it's best to make the
  antenna a little longer than the calculated value and then trim it to get the
  best SWR value.

 Feedpoint impedance and coaxial matching section

 The feedpoint impedance at the design frequency is about 100 ohms, so full
 wave loops are often fed with an impedance-matching section made from a
 piece of 75-ohm coxial cable one quarter wavelength long (shortened to
 compensate for the velocity factor of the cable).

 Length of an impedance-matching section with 75-ohm cable with a velocity
 factor of 0.66 (polyethylene dielectric):

 * 1 feet 1.3 inches
 * 0.34 meters

 Length of an impedance matching section made with 75-ohm cable with a cable
 velocity factor of 0.80 (foam dielectric):

 * 1 feet 4.1 inches
 * 0.41 meters

 The formulas for calculating the approximate length of a full-wave loop antenna are:
 * Full-wave loop in feet = 1005 / frequency in MHz
 * Full-wave in meters = 306 / frequency in MHz

 The formulas for calculating the length of an impedance matching section are:
 * Quarter-wave matching section length in feet = 246 * cable's velocity factor / frequency in MHz
 * Quarter-wave matching section length in meters = 75 * cable's velocity factor / frequency in MHz

 The velocity factor for polyethylene coax is usually 0.66. For foam-dielectric cable, it's usually 0.8.

146.670 MHz -> 0.333 meters radius for full wave loop at Anoka County Radio Club repeater frequency.
