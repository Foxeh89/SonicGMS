/// game_pc_sample_y(character, script)
// ---------------------------------------------------------------
/*  
**  Executes the given script a number of times equal to the
**  player's current vertical speed divided by the vertical size
**  of the virtual mask. Ensures the player does not 'miss'
**  intersections at higher speeds.
**
**  Arguments:
**      character   Real; player character instance index
**      script      Real; index of movement script (must be
**                  formatted to accept a single 'step' as an
**                  argument)
**
**  Returns:
**      N/A
*/
// ---------------------------------------------------------------
var character = argument0;
var script = argument1;
// ---------------------------------------------------------------

with (character) {
    var total_steps = 1 + floor(abs(y_speed) / y_radius);
    var step = y_speed / total_steps;
    repeat (total_steps) {
        script_execute(script, character, step);
    }
}
