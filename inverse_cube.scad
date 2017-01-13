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

echo(version());

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

union() {
    cube(init_size, center = true);
    
    aux_cubes(1, [0, 0, 0]);
}