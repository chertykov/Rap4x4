#! /usr/bin/python

import sys
import math
from solid import *
from solid.utils import * # Not required, but the utils module is useful

use ("nema17.scad")


m_pulley = color("gray") (import_stl ("Pulleys/pulley-GT2-5x16t.stl"))
# Toothed diametr ~= 10.4
m_pulley_r = 10.4 / 2

idler = color("red") (import_stl ("Pulleys/idler-624.stl"))
# Toothed diametr ~= 16
idler_r = 16 / 2

# rods length
rod_l = 330
rod_motor_overlap = 20
rod_idler_overlap = 10


rod1 = rotate ([-90, 0, 0]) (cylinder (r = 4, h = rod_l))
rod2 = rotate ([0, -90, 0]) (cylinder (r = 4, h = rod_l))
motor = rotate([0,180,0]) (nema17())
# Motor + pylley
motor += up (1) (m_pulley)

motor_right = +5

idler_back = motor_right - m_pulley_r + idler_r

motor_idler = right (motor_right) (motor) \
              + back (idler_back) (left (22) (up (7.5) (idler)))

draw = motor_idler \
       + forward(rod_l - rod_motor_overlap + rod_idler_overlap) (rotate ([0,0,90]) (motor_idler))

draw +=  back (rod_motor_overlap) (up (22 + 4) (rod1)) \
       + left (rod_idler_overlap) (up (22 + 4) (rod2)) \

print scad_render(draw)
