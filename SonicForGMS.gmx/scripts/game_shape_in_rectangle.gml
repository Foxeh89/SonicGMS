/// game_shape_in_rectangle(shape, x1, y1, x2, y2)

var shape = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;

var result = 0;

var kind = shape.object_index;

if (object_is_family(kind, Rectangle)) {
    var dx1 = shape.bbox_left;
    var dy1 = shape.bbox_top;
    var dx2 = shape.bbox_right + 1;
    var dy2 = shape.bbox_bottom + 1;
    result = rectangle_in_rectangle(x1, y1, x2, y2, dx1, dy1, dx2, dy2);
} else if (object_is_family(kind, RightTriangle)) {
    var dx1 = shape.x;
    var dy1 = shape.y;
    var dx2 = shape.x + shape.sprite_width;
    var dy2 = shape.y + shape.sprite_height;
    result = rectangle_in_triangle_full(x1, y1, x2, y2, dx1, dy2, dx2, dy1, dx2, dy2);
} else if (object_is_family(kind, QuarterEllipse)) {
    var cx = shape.x + shape.sprite_width;
    var cy = shape.y + shape.sprite_height;
    var xrad = -shape.sprite_width;
    var yrad = -shape.sprite_height;
    result = rectangle_in_quarter_ellipse(x1, y1, x2, y2, cx, cy, xrad, yrad);
} else if (object_is_family(kind, QuarterPipe)) {
    var cx = shape.x;
    var cy = shape.y;
    var xrad = shape.sprite_width;
    var yrad = shape.sprite_height;
    result = rectangle_in_quarter_pipe(x1, y1, x2, y2, cx, cy, xrad, yrad);
} else {
    result = rectangle_in_object(x1, y1, x2, y2, shape, true, true);
}

return result;
