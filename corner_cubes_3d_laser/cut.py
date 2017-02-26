import math


class Cut:
    def __init__(self, side_length, iteration, cut_type):
        self.length = side_length
        self.iteration = iteration
        self.type = cut_type

        self.__generate_tabs()

    def __generate_tabs(self):
        if(math.floor(self.length) >= 3):
            self.tab_count = math.floor(self.length)
        else:
            self.tab_count = 3

        self.tab_width = self.length / self.tab_count

    def generate_cut(self):
        pass
