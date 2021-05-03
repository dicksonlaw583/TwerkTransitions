///@func tt_slide_down(targetSurface, fromSurface, toSurface)
///@param {Surface} targetSurface
///@param {Surface} fromSurface
///@param {Surface} toSurface
///@desc Slide down
function tt_slide_down(_targetSurface, _fromSurface, _toSurface) {
	// Default options
	settings = __tt_merge_options__({
		time: 1000,
		slideArgs: ["type", te_bounce_out]
	}, params);
	// Initialize
	if (is_undefined(_targetSurface)) {
		after = false;
		__image_alpha = InstanceVar("image_alpha");
		__y = InstanceVar("y");
		Tween(__image_alpha.set(0), 1, settings.time);
		Tween(__y.set(-surface_get_height(application_surface)), 0, settings.time, settings.slideArgs);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(_targetSurface);
		draw_surface(_fromSurface, 0, 0);
		draw_surface_ext(_toSurface, 0, y, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}
