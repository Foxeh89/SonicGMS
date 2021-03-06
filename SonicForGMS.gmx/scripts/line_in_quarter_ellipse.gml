/// line_in_quarter_ellipse(sx1, sy1, sx2, sy2, cx, cy, xrad, yrad)
// ---------------------------------------------------------------
/*  
**  Checks if the given line crosses the given quarter ellipse
**
**  Arguments:
**      sx1     real; first line first point x-position
**      sy1     real; first line first point y-position
**      sx2     real; first line second point x-position
**      sy2     real; first line second point y-position
**      cx      real; ellipse centre point x-position
**      cy      real; ellipse centre point y-position
**      xrad    real; ellipse x-radius
**      yrad    real; ellipse y-radius
**
**  Returns:
**      Real; 0: no intersect; 1: completely inside;
**      2: overlapping
**
*/
// ---------------------------------------------------------------
var sx1 = argument0;
var sy1 = argument1;
var sx2 = argument2;
var sy2 = argument3;
var cx = argument4;
var cy = argument5;
var xrad = argument6;
var yrad = argument7;
// ---------------------------------------------------------------

var result = 1; // completely inside

var dx1 = cx;
var dy1 = cy;
var dx2 = cx + xrad;
var dy2 = cy + yrad;
if (dx1 > dx2) {
    dx1 = cx + xrad;
    dx2 = cx;
}
if (dy1 > dy2) {
    dy1 = cy + yrad;
    dy2 = cy;
}

var rectangle = line_in_rectangle(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2);
var ellipse = line_in_ellipse(sx1, sy1, sx2, sy2, cx, cy, abs(xrad), abs(yrad));

if (rectangle == 0 or ellipse == 0) {
    result = 0;
} else if (rectangle == 2 or ellipse == 2) {
    result = 2; // overlap
}

return result;
