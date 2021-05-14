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


///@func tt_wipe_vertical()
///@desc Wipe from up and down towards middle
function tt_wipe_vertical() {
	var halfHeight = surface_get_height(application_surface) div 2;
	var fullWidth = surface_get_width(application_surface);
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
		y1 = 0;
		y2 = 2*halfHeight;
		__tt_tween__(InstanceVar("y1"), halfHeight, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y2"), halfHeight, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, fullWidth, y1, 0, 0);
		draw_surface_part(application_surface, 0, y2, fullWidth, 2*halfHeight-y2, 0, y2);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_wipe_horizontal()
///@desc Wipe from left and right towards middle
function tt_wipe_horizontal() {
	var fullHeight = surface_get_height(application_surface);
	var halfWidth = surface_get_width(application_surface) div 2;
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
		x1 = 0;
		x2 = 2*halfWidth;
		__tt_tween__(InstanceVar("x1"), halfWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x2"), halfWidth, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, x1, fullHeight, 0, 0);
		draw_surface_part(application_surface, x2, 0, 2*halfWidth-x2, fullHeight, x2, 0);
		draw_set_alpha(1);
		surface_reset_target();
	}
}
