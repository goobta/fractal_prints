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


class Cut:
    def __init__(self, side_length, iteration, cut_type):
        self.length = side_length
        self.iteration = iteration
        self.type = cut_type

        self.__generate_tabs()

    def __generate_tabs(self):
        if math.floor(self.length) >= 3:
            self.tab_count = math.floor(self.length)
        else:
            self.tab_count = 3

        self.tab_width = self.length / self.tab_count

    def generate_cut(self):
        if self.type == "a":
            return self.__gen_cut_a()
        elif self.type == "b":
            return self.__gen_cut_b()
        elif self.type == "c":
            return self.__gen_cut_c()
        elif self.type == "a90":
            return self.__gen_cut_a90()
        elif self.type == "b90":
            return self.__gen_cut_b90()
        elif self.type == "c90":
            return self.__gen_cut_c90()
        else:
            return None

    def __gen_cut_a(self):
        pass

    def __gen_cut_b(self):
        pass

    def __gen_cut_c(self):
        pass

    def __gen_cut_a90(self):
        pass

    def __gen_cut_b90(self):
        pass

    def __gen_cut_c90(self):
        pass
