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

///@func tt_slide_in_vertical()
///@desc Slide in halves from top and bottom
function tt_slide_in_vertical() {
	var halfHeight = surface_get_height(application_surface) div 2;
	var fullWidth = surface_get_width(application_surface);
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
		y1 = -halfHeight;
		y2 = 2*halfHeight;
		__tt_tween__(InstanceVar("y1"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y2"), halfHeight, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, fullWidth, halfHeight, 0, y1);
		draw_surface_part(application_surface, 0, halfHeight, fullWidth, halfHeight, 0, y2);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_slide_in_horizontal()
///@desc Slide in halves from left and right
function tt_slide_in_horizontal() {
	var fullHeight = surface_get_height(application_surface);
	var halfWidth = surface_get_width(application_surface) div 2;
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
		x1 = -halfWidth;
		x2 = 2*halfWidth;
		__tt_tween__(InstanceVar("x1"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x2"), halfWidth, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, halfWidth, fullHeight, x1, 0);
		draw_surface_part(application_surface, halfWidth, 0, halfWidth, fullHeight, x2, 0);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_slide_in_4way()
///@desc Slide in quarters from each corner
function tt_slide_in_4way() {
	var halfWidth = surface_get_width(application_surface) div 2;
	var halfHeight = surface_get_height(application_surface) div 2;
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
		x1 = -halfWidth;
		y1 = -halfHeight;
		x2 = 2*halfWidth;
		y2 = -halfHeight;
		x3 = -halfWidth;
		y3 = 2*halfHeight;
		x4 = 2*halfWidth;
		y4 = 2*halfHeight;
		__tt_tween__(InstanceVar("x1"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y1"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x2"), halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y2"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x3"), 0, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y3"), halfHeight, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x4"), halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y4"), halfHeight, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(application_surface, 0, 0, halfWidth, halfHeight, x1, y1);
		draw_surface_part(application_surface, halfWidth, 0, halfWidth, halfHeight, x2, y2);
		draw_surface_part(application_surface, 0, halfHeight, halfWidth, halfHeight, x3, y3);
		draw_surface_part(application_surface, halfWidth, halfHeight, halfWidth, halfHeight, x4, y4);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_slide_out_vertical()
///@desc Slide out halves to top and bottom
function tt_slide_out_vertical() {
	var halfHeight = surface_get_height(application_surface) div 2;
	var fullWidth = surface_get_width(application_surface);
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
		y1 = 0;
		y2 = halfHeight;
		__tt_tween__(InstanceVar("y1"), -halfHeight, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y2"), 2*halfHeight, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(application_surface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(fromSurface, 0, 0, fullWidth, halfHeight, 0, y1);
		draw_surface_part(fromSurface, 0, halfHeight, fullWidth, halfHeight, 0, y2);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_slide_out_horizontal()
///@desc Slide out halves to left and right
function tt_slide_out_horizontal() {
	var fullHeight = surface_get_height(application_surface);
	var halfWidth = surface_get_width(application_surface) div 2;
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
		x1 = 0;
		x2 = halfWidth;
		__tt_tween__(InstanceVar("x1"), -halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x2"), 2*halfWidth, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(application_surface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(fromSurface, 0, 0, halfWidth, fullHeight, x1, 0);
		draw_surface_part(fromSurface, halfWidth, 0, halfWidth, fullHeight, x2, 0);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

///@func tt_slide_out_4way()
///@desc Slide out quarters to each corner
function tt_slide_out_4way() {
	var halfWidth = surface_get_width(application_surface) div 2;
	var halfHeight = surface_get_height(application_surface) div 2;
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
		x1 = 0;
		y1 = 0;
		x2 = halfWidth;
		y2 = 0;
		x3 = 0;
		y3 = halfHeight;
		x4 = halfWidth;
		y4 = halfHeight;
		__tt_tween__(InstanceVar("x1"), -halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y1"), -halfHeight, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x2"), 2*halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y2"), -halfHeight, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x3"), -halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y3"), 2*halfHeight, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("x4"), 2*halfWidth, settings.time, settings.slideType);
		__tt_tween__(InstanceVar("y4"), 2*halfHeight, settings.time, settings.slideType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(application_surface, 0, 0);
		draw_set_alpha(image_alpha);
		draw_surface_part(fromSurface, 0, 0, halfWidth, halfHeight, x1, y1);
		draw_surface_part(fromSurface, halfWidth, 0, halfWidth, halfHeight, x2, y2);
		draw_surface_part(fromSurface, 0, halfHeight, halfWidth, halfHeight, x3, y3);
		draw_surface_part(fromSurface, halfWidth, halfHeight, halfWidth, halfHeight, x4, y4);
		draw_set_alpha(1);
		surface_reset_target();
	}
}