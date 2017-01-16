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
iterations = 3;

echo(version());

translation_vectors = [[1, 1], [-1, -1], [-1, 1], [1, -1]];
rotation_vectors = [[1, 1, -1], [1, 1, -1], [1, 1, 1], [1, 1, 1]];

function ev_mult(vec1, vec2) =
    len(vec1) != len(vec2) ? false : [for(i = [0:len(vec1) - 1]) vec1[i] * vec2[i]];

module translated_cube(translation_vector, starting_pos, size) {
    translate(translation_vector + starting_pos) {
      square(size, center = true);
    }
}

module connector(vector_keys, connector_size, square_size, starting_pos, current_iteration) {
    if(current_iteration < iterations) {
        for(i = vector_keys) {
            corner = ev_mult(translation_vectors[i], [square_size / 2, square_size / 2]) + starting_pos;
            connector_correction = ev_mult(translation_vectors[i], [connector_size / (2 * sqrt(2)), connector_size / (2 * sqrt(2))]);
            next_square_center = corner + ev_mult(translation_vectors[i], [connector_size / sqrt(2), connector_size / sqrt(2)]);

            translate(corner + connector_correction) {
                rotate(ev_mult(rotation_vectors[i], [0, 45, 45])) {
                    #square([connector_thickness, connector_size], center = true);
                }
            }

            if(i == 0) {
                pattern(next_square_center, "bottom_left", current_iteration + 1);
            }
            else if(i == 1) {
                pattern(next_square_center, "top_right", current_iteration + 1);
            }
            else if(i == 2) {
                pattern(next_square_center, "bottom_right", current_iteration + 1);
            }
            else if(i == 3){
                pattern(next_square_center, "top_left", current_iteration + 1);
            }
        }
    }
}

module pattern(starting_pos, seed_corner, current_iteration) {
    translation = false;
    translations = false;
    rotations = false;
    current_size = init_square_size * pow(iteration_multiplier, current_iteration - 1);
    current_connector_size = connector_length * pow(iteration_multiplier, current_iteration - 1);

    if(seed_corner == "center") {
        translated_cube([0,0], starting_pos, current_size);
        connector([0, 1, 2, 3], current_connector_size, current_size, starting_pos, current_iteration);
    }
    else if(seed_corner == "bottom_left") {
        translated_cube([current_size / 2, current_size / 2], starting_pos, current_size);
        connector([0, 2, 3], current_connector_size, current_size, starting_pos, current_iteration);
    }
    else if(seed_corner == "bottom_right") {
        translated_cube([-current_size / 2, current_size / 2], starting_pos, current_size);
        connector([0, 1, 2], current_connector_size, current_size, starting_pos, current_iteration);
    }
    else if(seed_corner == "top_left") {
        translated_cube([current_size / 2, -current_size / 2], starting_pos, current_size);
        connector([0, 1, 3], current_connector_size, current_size, starting_pos, current_iteration);
    }
    else if(seed_corner == "top_right") {
        translated_cube([-current_size / 2, -current_size / 2], starting_pos, current_size);
        connector([1, 2, 3], current_connector_size, current_size, starting_pos, current_iteration);
    }
}

pattern([0, 0], "center", 1);
