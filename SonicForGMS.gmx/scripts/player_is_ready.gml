/// player_is_ready(phase)

var phase = argument0;

switch (phase) {
case "start":
    break;

case "finish":
    break;

case "step":
    game_pc_perform(self, player_is_standing);
    break;
}
