/**
Program by Ankur Gupta
www.github.com/agupta231
Jan 2017


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

init_cube_size = 50;
iteration_factor = 0.45;
iterations = 4;

echo("---- Gupta 2017 ----");
echo(version());
echo("--------------------");

module iter_cube(current_iter, starting_pos) {
  iter_size = init_cube_size * pow(iteration_factor, current_iter);
  displacement = (init_cube_size * pow(iteration_factor, current_iter - 1)) / 2;

  for(i = [
    [-1, -1, -1],
    [-1, -1, 1],
    [-1, 1, 1],
    [1, 1, 1],
    [1, 1, -1],
    [1, -1, -1],
    [1, -1, 1],
    [-1, 1, -1]]
  ){
    disp_vect = displacement * i;

    translate(starting_pos + disp_vect) {
      cube(iter_size, center = true);
    }

    if(current_iter < iterations) {
      iter_cube(current_iter + 1, starting_pos + disp_vect);
    }
  }
}

union() {
  cube(init_cube_size, center = true);

  iter_cube(1, [0, 0, 0]);
}
