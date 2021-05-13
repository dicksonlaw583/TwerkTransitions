///@func tt_wipe_down()
///@desc Wipe down
function tt_wipe_down() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			wipeType: te_swing,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(0), surface_get_height(application_surface), settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_part_ext(application_surface, 0, 0, surface_get_width(application_surface), y, 0, 0, 1, 1, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_wipe_up()
///@desc Wipe up
function tt_wipe_up() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			wipeType: te_swing,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(surface_get_height(application_surface)), 0, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_part_ext(application_surface, 0, y, surface_get_width(application_surface), surface_get_height(application_surface)-y, 0, y, 1, 1, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_wipe_right()
///@desc Wipe right
function tt_wipe_right() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			wipeType: te_swing,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(0), surface_get_width(application_surface), settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_part_ext(application_surface, 0, 0, x, surface_get_height(application_surface), 0, 0, 1, 1, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_wipe_left()
///@desc Wipe left
function tt_wipe_left() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			wipeType: te_swing,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(surface_get_width(application_surface)), 0, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_part_ext(application_surface, x, 0, surface_get_width(application_surface)-x, surface_get_height(application_surface), x, 0, 1, 1, c_white, image_alpha);
		surface_reset_target();
	}
}
