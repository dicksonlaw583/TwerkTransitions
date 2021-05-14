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
	["Push down (bounce)", tt_push_down, { pushType: te_bounce_out }],
	["Push up (back out, with fade)", tt_push_up, { fadeType: te_linear, pushType: te_back_out }],
	["Push right (elastic)", tt_push_right, { pushType: te_elastic_out }],
	["Push left (quick, with fade)", tt_push_left, { fadeType: te_linear, pushType: te_quintic_out }],
	["Wipe down (swing, with fade)", tt_wipe_down, { fadeType: te_linear, wipeType: te_swing }],
	["Wipe up (swing)", tt_wipe_up, { wipeType: te_swing }],
	["Wipe right (swing, with fade)", tt_wipe_right, { fadeType: te_linear, wipeType: te_swing }],
	["Wipe left (swing)", tt_wipe_left, { wipeType: te_swing }],
	["Wipe vertical 2-way (quick)", tt_wipe_vertical, { wipeType: te_quintic_out }],
	["Wipe horizontal 2-way (quick, with fade)", tt_wipe_horizontal, { fadeType: te_linear, wipeType: te_quintic_out }],
	["Wipe 4-way (quick)", tt_wipe_4way, { wipeType: te_quintic_out }],
];
