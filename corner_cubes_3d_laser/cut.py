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

import math
import svgwrite
from svgwrite import inch


class Cut:
    def __init__(self, side_length, iteration, cut_type, material_thickness):
        self.length = side_length
        self.iteration = iteration
        self.type = cut_type
        self.thickness = material_thickness

        self.__generate_tabs()

    def __generate_tabs(self):
        if math.floor(self.length) >= 3:
            self.tab_count = math.floor(self.length)

            if not self.tab_count % 2:
                self.tab_count -= 1
        else:
            self.tab_count = 3

        self.tab_width = self.length / self.tab_count

    def generate_cut(self, drawing, starting_pos):
        if self.type == "a":
            return self.__gen_cut_a(drawing, starting_pos)
        elif self.type == "b":
            return self.__gen_cut_b(drawing, starting_pos)
        elif self.type == "c":
            return self.__gen_cut_c(drawing, starting_pos)
        elif self.type == "a90":
            return self.__gen_cut_a90(drawing, starting_pos)
        elif self.type == "b90":
            return self.__gen_cut_b90(drawing, starting_pos)
        elif self.type == "c90":
            return self.__gen_cut_c90(drawing, starting_pos)
        else:
            return None

    def __gen_cut_a(self, drawing, starting_pos):

        pass

    def __gen_cut_b(self, drawing, starting_pos):
        pass

    def __gen_cut_c(self, drawing, starting_pos):
        pass

    def __gen_cut_a90(self, drawing, starting_pos):
        pass

    def __gen_cut_b90(self, drawing, starting_pos):
        pass

    def __gen_cut_c90(self, drawing, starting_pos):
        pass
