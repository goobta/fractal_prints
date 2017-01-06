// Program by Ankur Gupta
// www.github.com/agupta231
// Jan 2017

/**
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
**/

init_size = 50;
iteration_multiplier = 0.5;
iterations = 5;
hull_width = 7;
strut_width = 3;

echo(version());
echo("Total Size: ---------");
echo(((init_size * iteration_multiplier) * (1 - pow(iteration_multiplier, iterations))) / (1 - iteration_multiplier) * 2 + init_size);
echo("---------------------");

module aux_cubes(current_iter, starting_pos) {
    iter_size = init_size * pow(iteration_multiplier, current_iter);
    displacement = (init_size * (pow(iteration_multiplier, current_iter) + pow(iteration_multiplier, current_iter - 1))) / 2;
    
    for(i = [[displacement, 0, 0], [-displacement, 0, 0], [0, displacement, 0], [0, -displacement, 0], [0, 0, displacement], [0, 0, -displacement]]) {
        new_pos = i + starting_pos;
        
        translate(i + starting_pos) {
            cube(iter_size, center = true);
        }
        
        if(current_iter < iterations) {
            aux_cubes(current_iter + 1, new_pos);
        }
    }
}

module struts(total_length) {
    strut_length = total_length * sqrt(3) + hull_width / 2;
    
    for(i = [[35, 0, -45], [35, 0, 45], [-35, 0, 45], [-35, 0, -45]]) {
        rotate(i) {
            cube([strut_width, strut_length, strut_width], center = true);
        }
    }
}

module enclosure() {
    total_length = ((init_size * iteration_multiplier) * (1 - pow(iteration_multiplier, iterations))) / (1 - iteration_multiplier) * 2 + init_size;
    
    union() {
        difference() {
            cube(total_length + hull_width, center = true);
        
            for(i = [[hull_width + 1, 0, 0], [0, hull_width + 1, 0], [0, 0, hull_width + 1], [-hull_width - 1, 0, 0], [0, -hull_width - 1, 0], [0, 0, -hull_width - 1]]) {
                translate(i) {
                    cube(total_length, center = true);
                }
            }
        }
        
        struts(total_length);
    }
}

union() {
    cube(init_size, center = true);
    aux_cubes(1, [0, 0, 0]);
    
    enclosure();
    
}