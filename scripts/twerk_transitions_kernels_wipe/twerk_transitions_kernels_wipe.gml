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


///@func tt_wipe_in_vertical()
///@desc Wipe from up and down towards middle
function tt_wipe_in_vertical() {
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

///@func tt_wipe_in_horizontal()
///@desc Wipe from left and right towards middle
function tt_wipe_in_horizontal() {
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

///@func tt_wipe_in_4way()
///@desc Wipe from the corners towards middle
function tt_wipe_in_4way() {
	var fullWidth = surface_get_width(application_surface);
	var fullHeight = surface_get_height(application_surface);
	var halfWidth = fullWidth div 2;
	var halfHeight = fullHeight div 2;
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
		y1 = 0;
		x2 = fullWidth;
		y2 = 0;
		x3 = 0;
		y3 = fullHeight;
		x4 = fullWidth;
		y4 = fullHeight;
		__tt_tween__(InstanceVar("x1"), halfWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y1"), halfHeight, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x2"), halfWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y2"), halfHeight, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x3"), halfWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y3"), halfHeight, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x4"), halfWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y4"), halfHeight, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, x1, y1, 0, 0);
		draw_surface_part(application_surface, x2, 0, fullWidth-x2, y2, x2, 0);
		draw_surface_part(application_surface, 0, y3, x3, fullHeight-y3, 0, y3);
		draw_surface_part(application_surface, x4, y4, fullWidth-x4, fullHeight-y4, x4, y4);
		draw_set_alpha(1);
		surface_reset_target();
	}
}


///@func tt_wipe_out_vertical()
///@desc Wipe from up and down away from middle
function tt_wipe_out_vertical() {
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
		y1 = halfHeight;
		y2 = halfHeight;
		__tt_tween__(InstanceVar("y1"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y2"), 2*halfHeight, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, y1, fullWidth, y2-y1, 0, y1);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_wipe_out_horizontal()
///@desc Wipe from left and right away from middle
function tt_wipe_out_horizontal() {
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
		x1 = halfWidth;
		x2 = halfWidth;
		__tt_tween__(InstanceVar("x1"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x2"), 2*halfWidth, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, x1, 0, x2-x1, fullHeight, x1, 0);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_wipe_out_4way()
///@desc Wipe from the corners away from middle
function tt_wipe_out_4way() {
	var fullWidth = surface_get_width(application_surface);
	var fullHeight = surface_get_height(application_surface);
	var halfWidth = fullWidth div 2;
	var halfHeight = fullHeight div 2;
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			wipeType: te_swing,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		x1 = halfWidth;
		y1 = halfHeight;
		x2 = halfWidth;
		y2 = halfHeight;
		x3 = halfWidth;
		y3 = halfHeight;
		x4 = halfWidth;
		y4 = halfHeight;
		__tt_tween__(InstanceVar("x1"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y1"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x2"), fullWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y2"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x3"), 0, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y3"), fullHeight, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("x4"), fullWidth, settings.time, settings.wipeType);
		__tt_tween__(InstanceVar("y4"), fullHeight, settings.time, settings.wipeType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(application_surface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(fromSurface, 0, 0, x1, y1, 0, 0);
		draw_surface_part(fromSurface, x2, 0, fullWidth-x2, y2, x2, 0);
		draw_surface_part(fromSurface, 0, y3, x3, fullHeight-y3, 0, y3);
		draw_surface_part(fromSurface, x4, y4, fullWidth-x4, fullHeight-y4, x4, y4);
		draw_set_alpha(1);
		surface_reset_target();
	}
}
