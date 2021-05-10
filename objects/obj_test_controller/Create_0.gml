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
	["Slide in left and right (swing)", tt_slide_in_horizontal, { slideType: te_swing }],
	["Slide in 4-way (bounce)", tt_slide_in_4way, { slideType: te_bounce_out }],
	["Horizontal flip (swing)", tt_flip_horizontal, {}],
	["Vertical flip (back-in-out)", tt_flip_vertical, { spinType: te_back_inout }],
	["Slide out top and bottom (bounce)", tt_slide_out_vertical, { fadeType: undefined, slideType: te_bounce_out }],
	["Slide out left and right (swing)", tt_slide_out_horizontal, { slideType: te_swing }],
	["Slide out 4-way (bounce)", tt_slide_out_4way, { slideType: te_bounce_out }],
];
