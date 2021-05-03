///@desc Define types
currentType = 0;
time = 1000;
types = [
	["Crossfade", tt_crossfade, {}],
	["Fade through colour", tt_fade_colour, {}],
	["Bounce down", tt_slide_down, {}],
	["Slide up", tt_slide_up, { fadeType: te_linear, slideType: te_back_out }],
];
