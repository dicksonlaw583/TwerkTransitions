///@func tt_slide_down()
///@desc Slide down
function tt_slide_down() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			slideType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(-surface_get_height(application_surface)), 0, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_ext(application_surface, 0, y, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_slide_up()
///@desc Slide up
function tt_slide_up() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			slideType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("y").set(surface_get_height(application_surface)), 0, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_ext(application_surface, 0, y, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_slide_right()
///@desc Slide right
function tt_slide_right() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			slideType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(-surface_get_width(application_surface)), 0, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_ext(application_surface, x, 0, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_slide_left()
///@desc Slide left
function tt_slide_left() {
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: undefined,
			slideType: te_bounce_out,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		__tt_tween__(InstanceVar("x").set(surface_get_width(application_surface)), 0, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_ext(application_surface, x, 0, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}
