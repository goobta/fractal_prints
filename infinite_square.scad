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

init_square_size = 40;
connector_length = 30;
connector_thickness = 0.1;
iteration_multiplier = 0.5;
iterations = 1;

echo(version());

translation_vectors = [[1, 1], [-1, -1], [-1, 1], [1, -1]];
rotation_vectors [[1, 1, -1], [1, 1, -1], [1, 1, 1], [1, 1, 1]];

module pattern(starting_pos, seed_corner, current_iteration) {
    translation = false;
    current_size = init_square_size * pow(iteration_multiplier, current_iteration - 1);
    
    if(seed_corner == "center") {
        translation = [0,0];
        translations = translation_vectors;
        rotations = rotation_vectors;
    }
    else if(seed_corner == "bottom_left") {
        translation = [current_size / 2, current_size / 2];
        translations = 
    }
    else if(seed_corner == "bottom_right") {
        translation = [-current_size / 2, current_size / 2];
    }
    else if(seed_corner == "top_left") {
        translation = [current_size / 2, -current_size / 2];
    }
    else if(seed_corner == "top_right") {
        translation = [-current_size / 2, -current_size / 2];
    }

    translate(translation) {
        //square(current_size, center = true);
    }
}

pattern([0, 0], "center", 1);