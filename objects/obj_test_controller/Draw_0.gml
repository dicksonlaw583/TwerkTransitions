///@desc User interface
draw_set_font(fnt_tttest_text);
draw_set_colour(c_black);
draw_text(x, y, "Change transition with LEFT/RIGHT\nChange duration with UP/DOWN\n\nCurrent transition: " + types[currentType][0] + "\nTime: " + string(time) + "ms");
