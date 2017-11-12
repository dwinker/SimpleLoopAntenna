#!  /usr/bin/perl -w

use strict;

# c/118 MHz = 2.54 meters.
# c/170 MHz = 1.76 meters.
# Small loop ~ 10% wavelength at 1.76 meters -> 0.028 meters radius
# Large loop ~  1  wavelength at 2.54 meters -> 0.400 meters radius
my $ns   =  4;      # Number of segments into which the arc will be divided.
my $rada = 0.400;   # Arc radius (center is the origin and the axis is the y axis).
my $ang1 = -88.0;   # Angle of first end of the arc measured from the x axis in a left-hand direction about the y axis (degrees).
my $ang2 = 268.0;   # Angle of the second end of the arc.
my $rad  = 0.006;   # Wire radius.

my $pi = 4 * atan2(1, 1);   # 3.14159...
my $x1 = -1 * $rada * cos($ang1 * $pi / 180.0);
my $z1 =      $rada * sin($ang1 * $pi / 180.0);
my $x2 = -1 * $rada * cos($ang2 * $pi / 180.0);
my $z2 =      $rada * sin($ang2 * $pi / 180.0);

#print "DEBUG: x1=$x1 z1=$z1 x2=$x2 z2=$z2\n";
#exit;

my $nfrq     = 10;
my $fmhz     = 118.0;
my $end_fmhz = 170.0;
my $delfrq   = ($end_fmhz - $fmhz) / ($nfrq - 1);

my $nth = 31;
my $nph = 31;
my $dth = 360.0 / $nth;
my $dph = 360.0 / $nph;

print << "EOT";
CM  Simple loop antenna to locate interference using car's 2M radio.
CE
GA 1 $ns $rada $ang1 $ang2 $rad
GW 2 1 $x1 0.00 $z1 $x2 0.00 $z2 $rad
GE
EX 0 2 1 0 1.00 0.00 0.00 0.00 0.00 0.00
FR 0 $nfrq 0 0 $fmhz $delfrq 0.00 0.00 0.00 0.00
RP 0 $nth $nph 1000 0.00 0.00 $dth $dph
EN
EOT
