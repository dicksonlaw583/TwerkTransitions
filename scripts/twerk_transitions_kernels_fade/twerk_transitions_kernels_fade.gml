///@func tt_crossfade()
///@desc Simple crossfade
function tt_crossfade() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: te_linear,
		}, params);
		__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_fade_colour()
///@desc Fade through colour
function tt_fade_colour() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeOutType: te_linear,
			fadeInType: te_linear,
			colour: c_black,
		}, params);
		after = false;
		Workflow([
			function() {
				return __tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time/2, settings.fadeOutType);
			},
			function() {
				after = true;
			},
			function() {
				return __tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time/2, settings.fadeInType);
			},
			function() {
				instance_destroy();
			}
		]);
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface_ext(after ? application_surface : fromSurface, 0, 0, 1, 1, 0, c_white, 1);
		draw_set_alpha(image_alpha);
		draw_set_colour(settings.colour);
		draw_rectangle(0, 0, surface_get_width(overlaySurface), surface_get_height(overlaySurface), false);
		draw_set_alpha(1);
		surface_reset_target();
	}
}
