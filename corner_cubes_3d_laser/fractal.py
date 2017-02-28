# Program by Ankur Gupta
# www.github.com/agupta231
# Feb 2017
#
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import svgwrite
import glob
import os
from svgwrite import inch
from cut import Cut
from config import Config

class Fractal:
    def __init__(self):
        self.shape_queue = []

    def generate_plans(self):
        self.populate_cut_queue()

        drawing_filled = False

        while len(self.shape_queue) != 0:
            drawing = self.create_canvas()

            drawing.add(drawing.rect(insert=(0, 0),
                                     size=(str(Config.cutting_bed_width) + "in", str(Config.cutting_bed_height) + "in"),
                                     stroke_width=Config.stroke_thickness,
                                     stroke=Config.bounding_box_color,
                                     fill="none"))

            while not drawing_filled:
                pass


    def populate_cut_queue(self):
        for current_iteration in xrange(Config.iterations):
            self.shape_queue.append(Cut(current_iteration, "a"))
            self.shape_queue.append(Cut(current_iteration, "b"))
            self.shape_queue.append(Cut(current_iteration, "c"))

            if current_iteration == 0:
                self.shape_queue.append(Cut(current_iteration, "a"))
                self.shape_queue.append(Cut(current_iteration, "b"))
                self.shape_queue.append(Cut(current_iteration, "c"))

            else:
                self.shape_queue.append(Cut(current_iteration, "a90"))
                self.shape_queue.append(Cut(current_iteration, "b90"))
                self.shape_queue.append(Cut(current_iteration, "c90"))

    def create_canvas(self):
        return svgwrite.Drawing(filename="plan_" + str(len(glob.glob(os.getcwd() + "/plans/*"))) + ".svg")
