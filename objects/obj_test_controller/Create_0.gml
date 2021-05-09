///@desc Define types
currentType = 0;
time = 1000;
types = [
	["Crossfade", tt_crossfade, {}],
	["Fade through colour", tt_fade_colour, {}],
	["Slide down (bounce)", tt_slide_down, { slideType: te_bounce_out }],
	["Slide up (back out, with fade)", tt_slide_up, { fadeType: te_linear, slideType: te_back_out }],
	["Slide right (elastic)", tt_slide_right, { slideType: te_elastic_out }],
	["Slide left (quick, with fade)", tt_slide_left, { fadeType: te_linear, slideType: te_quintic_out }],
	["Minimize to centre (with fade)", tt_minimize, { fadeType: te_linear }],
	["Maximize from centre (elastic, no fade)", tt_maximize, { fadeType: undefined, scaleType: te_elastic_out }],
	["Slide in top and bottom (bounce)", tt_slide_in_vertical, { fadeType: undefined, slideType: te_bounce_out }],
];
