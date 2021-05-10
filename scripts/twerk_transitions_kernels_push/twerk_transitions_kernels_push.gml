///@func tt_push_down()
///@desc Push down
function tt_push_down() {
	var _fullHeight = surface_get_height(application_surface);
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			pushType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(-_fullHeight), 0, settings.time, settings.pushType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface_ext(fromSurface, 0, y+_fullHeight, 1, 1, 0, c_white, image_alpha);
		draw_surface(application_surface, 0, y);
		surface_reset_target();
	}
}

///@func tt_push_up()
///@desc Push up
function tt_push_up() {
	var _fullHeight = surface_get_height(application_surface);
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			pushType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(_fullHeight), 0, settings.time, settings.pushType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface_ext(fromSurface, 0, y-_fullHeight, 1, 1, 0, c_white, image_alpha);
		draw_surface(application_surface, 0, y);
		surface_reset_target();
	}
}

///@func tt_push_right()
///@desc Push right
function tt_push_right() {
	var _fullWidth = surface_get_width(application_surface);
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			pushType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(-_fullWidth), 0, settings.time, settings.pushType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface_ext(fromSurface, x+_fullWidth, 0, 1, 1, 0, c_white, image_alpha);
		draw_surface(application_surface, x, 0);
		surface_reset_target();
	}
}

///@func tt_push_left()
///@desc Push left
function tt_push_left() {
	var _fullWidth = surface_get_width(application_surface);
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			pushType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(_fullWidth), 0, settings.time, settings.pushType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface_ext(fromSurface, x-_fullWidth, 0, 1, 1, 0, c_white, image_alpha);
		draw_surface(application_surface, x, 0);
		surface_reset_target();
	}
}
