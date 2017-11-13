#!  /usr/bin/perl -w

use strict;

# c/118 MHz = 2.54 meters.
# c/170 MHz = 1.76 meters.
# Small loop ~ 10% wavelength at 1.76 meters -> 0.028 meters radius
# Large loop ~  1  wavelength at 2.54 meters -> 0.400 meters radius
my $ns   = 31;      # Number of segments into which the arc will be divided. Should be an odd number.
my $rada =  0.333;   # Arc radius (center is the origin and the axis is the y axis). 0.333 for 146.67 MHz.
my $ang1 = -270.0;   # Angle of first end of the arc measured from the x axis in a left-hand direction about the y axis (degrees).
my $ang2 =   90.0;   # Angle of the second end of the arc.
my $rad  =  0.001;   # Wire radius. 0.001 is approximately 14 AWG.

my $tl_length = 75.0 / 146.67;

my $nfrq     = 10;
my $fmhz     = 118.0;
my $end_fmhz = 170.0;
my $delfrq   = ($end_fmhz - $fmhz) / ($nfrq - 1);

my $nth = 31;
my $nph = 31;
my $dth = 360.0 / $nth;
my $dph = 360.0 / $nph;

my $rada_x_2 = $rada * 2;
my $middle_segment = int(($ns + 1) / 2);

print <<EOT;
CM  Simple loop antenna to locate interference using car's 2M radio.
CE
GA 2 $ns $rada $ang1 $ang2 $rad
GM 0 0 0.00 0.00 0.00 0.00 0.00 $rada_x_2
GW 1 1 -0.02 0.00 0.00 0.02 0.00 0.00 $rad
GE
EX 0 1 1 0 1.00 0.00 0.00 0.00 0.00 0.00
TL 1 1 2 $middle_segment 75.00 $tl_length
FR 0 $nfrq 0 0 $fmhz $delfrq 0.00 0.00 0.00 0.00
RP 0 $nth $nph 1000 0.00 0.00 $dth $dph
EN
EOT
