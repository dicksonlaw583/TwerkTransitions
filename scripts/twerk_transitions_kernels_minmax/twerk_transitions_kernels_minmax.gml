///@func tt_minimize()
///@desc Simple minimize
function tt_minimize() {
	// Initialize
	if (!ready) {
		var _halfWidth = surface_get_width(application_surface)/2;
		var _halfHeight = surface_get_height(application_surface)/2;
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: te_linear,
			scaleType: te_swing,
			originX: _halfWidth,
			originY: _halfHeight,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(1), 0, settings.time, settings.fadeType);
		}
		offsetX1 = 0;
		offsetY1 = 0;
		offsetX2 = 2*_halfWidth;
		offsetY2 = 2*_halfHeight;
		__tt_tween__(InstanceVar("offsetX1"), settings.originX, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetY1"), settings.originY, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetX2"), settings.originX, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetY2"), settings.originY, settings.time, settings.scaleType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(application_surface, 0, 0);
		draw_surface_stretched_ext(fromSurface, min(offsetX1, settings.originX), min(offsetY1, settings.originY), max(offsetX2-offsetX1, 0), max(offsetY2-offsetY1, 0), c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_maximize()
///@desc Simple maximize
function tt_maximize() {
	// Initialize
	if (!ready) {
		var _halfWidth = surface_get_width(application_surface)/2;
		var _halfHeight = surface_get_height(application_surface)/2;
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			fadeType: te_linear,
			scaleType: te_swing,
			originX: _halfWidth,
			originY: _halfHeight,
		}, params);
		if (!is_undefined(settings.fadeType)) {
			__tt_tween__(InstanceVar("image_alpha").set(0), 1, settings.time, settings.fadeType);
		}
		offsetX1 = settings.originX;
		offsetY1 = settings.originY;
		offsetX2 = settings.originX;
		offsetY2 = settings.originY;
		__tt_tween__(InstanceVar("offsetX1"), 0, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetY1"), 0, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetX2"), 2*_halfWidth, settings.time, settings.scaleType);
		__tt_tween__(InstanceVar("offsetY2"), 2*_halfHeight, settings.time, settings.scaleType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		draw_surface(fromSurface, 0, 0);
		draw_surface_stretched_ext(application_surface, min(offsetX1, settings.originX), min(offsetY1, settings.originY), max(offsetX2-offsetX1, 0), max(offsetY2-offsetY1, 0), c_white, image_alpha);
		surface_reset_target();
	}
}
