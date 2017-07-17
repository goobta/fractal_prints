// https://www.github.com/agupta231

// User set variables
init_side_len = 50.8;
max_iter = 10;

echo(version());

module pattern(starting_pos, side_size, rotation_matrix, current_iter) {
  translate(starting_pos) {
    rotate(rotation_matrix) {
        cube(side_size);
    }
  }

  echo(cos(30 - rotation_matrix[1]));

  if(current_iter <= max_iter) {
    pattern(starting_pos + [side_size * sin(rotation_matrix[1]), 0, side_size * cos(rotation_matrix[1])], side_size * sqrt(3) / 2, rotation_matrix + [0, -30, 0], current_iter + 1);
    /*#pattern(starting_pos + [0, 0, 0], side_size / 2, rotation_matrix + [0, 60, 0], current_iter + 1);*/
  }
}

pattern([0, 0, 0], init_side_len, [0, 30, 0], 1, 0);
