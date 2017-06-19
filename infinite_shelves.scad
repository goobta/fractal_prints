// www.github.com/agupta231

// user set variables
initial_side_length = 100;
initial_side_height = 30;
padding_ratio = .05;

knob_ratio = .2;

max_iterations = 3;

top_opening_ratio = .3;
bottom_opening_ratio = .7;

echo(version());

module shelf(length, depth, height) {
    difference() {
        cube([length, depth, height], center = true);

        translate([0, 0, length * padding_ratio]) {
            cube([(1 - padding_ratio) * length, depth - length * padding_ratio, height], center = true);
        }
    }

    translate([0, (1 + knob_ratio / 2) * depth / 2 ,0])
    cube([length * knob_ratio, depth * knob_ratio / 2, height * knob_ratio], center = true);
}

module pattern(current_iteration, starting_pos, length, depth, height) {
    padding = length * padding_ratio;

    length_new = length / 2 - padding;
    height_new = (height - padding * 3) / 2;

    if(current_iteration % 2 == 0) {
        echo(starting_pos + [0, depth / 2, 0]);

        translate(starting_pos + [0, (length_new * top_opening_ratio) / 2, 0]) {
            shelf(length_new, length_new * top_opening_ratio, height_new);
        }
    }
    else if(current_iteration % 2 == 1) {

    }
}

#shelf(initial_side_length, initial_side_length * bottom_opening_ratio, initial_side_height);

pattern(0, [0, 35, 0], initial_side_length, initial_side_length, initial_side_height);
