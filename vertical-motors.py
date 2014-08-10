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
# rod offset from center of motor
rod_motor_offset = 21
# idler rod offset from center of motor
rod_idler_offset = 6

rod1 = rotate ([-90, 0, 0]) (cylinder (r = 4, h = rod_l))
rod2 = rotate ([0, -90, 0]) (cylinder (r = 4, h = rod_l))

# Vertical motor
motor = rotate([0,180,0]) (nema17())
# Motor + pylley
motor += up (1) (m_pulley)
# Motor displacement relative to rod
motor_right = +5
# idler displacement relative to idler rod
idler_back = motor_right - m_pulley_r + idler_r
idler_z = 7.5
idler_left = 28


plate = (translate([-43/2,-43/2,-1]) (cube ([43,43,35])) 
         - translate ([0, -idler_back, ]) (cylinder (r = 15, h = 15))
         + (translate ([-43/2 - 17, - (idler_back + 12/2) ,-1])
            (cube ([17,12,8.5])))
         - down (-1) (cylinder(r = 22/2, h = 40)) 
#         - translate ([25+5,-5+5,0]) (up (5) (rotate (45) (cube ([70,70,40]))))

         - translate ([-43/2, 43/2,0]) (up (5) (cylinder (r = 9, h = 80)))
         - rotate (90) (translate ([-43/2, 43/2,0]) (up (5) (cylinder (r = 9, h = 80))))
         - rotate (180) (translate ([-43/2, 43/2,0]) (up (5) (cylinder (r = 9, h = 80))))
         - rotate (270) (translate ([-43/2, 43/2,0]) (up (5) (cylinder (r = 9, h = 80))))
         
         - translate ([-17/2,0,5]) (cube ([17, 25, 13])))


motor += plate

motor_idler = right (motor_right) (motor) \
              + back (idler_back) (left (idler_left) (up (idler_z) (idler)))

draw = motor_idler \
#       + forward(rod_l - rod_motor_offset + rod_idler_offset) (rotate ([0,0,90]) (motor_idler))

draw +=  back (rod_motor_offset) (up (22 + 4) (rod1)) \
       + left (rod_idler_offset) (up (22 + 4) (rod2)) \

print scad_render(draw)
