///@func tt_crossfade(targetSurface, fromSurface, toSurface)
///@param {Surface} targetSurface
///@param {Surface} fromSurface
///@param {Surface} toSurface
///@desc Simple crossfade
function tt_crossfade(_targetSurface, _fromSurface, _toSurface) {
	// Default options
	settings = __tt_merge_options__({
		time: 1000,
	}, params);
	// Initialize
	if (is_undefined(_targetSurface)) {
		__image_alpha = InstanceVar("image_alpha");
		Tween(__image_alpha.set(0), 1, settings.time, [
			"onDone", function() {
				instance_destroy();
			}
		]);
	}
	// Ongoing
	else {
		surface_set_target(_targetSurface);
		draw_surface(_fromSurface, 0, 0);
		draw_surface_ext(_toSurface, 0, 0, 1, 1, 0, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_fade_colour(targetSurface, fromSurface, toSurface)
///@param {Surface} targetSurface
///@param {Surface} fromSurface
///@param {Surface} toSurface
///@desc Fade through colour
function tt_fade_colour(_targetSurface, _fromSurface, _toSurface) {
	// Default options
	settings = __tt_merge_options__({
		time: 1000,
		colour: c_black,
	}, params);
	// Initialize
	if (is_undefined(_targetSurface)) {
		after = false;
		__image_alpha = InstanceVar("image_alpha");
		Workflow([
			function() {
				return Tween(__image_alpha.set(0), 1, settings.time/2);
			},
			function() {
				after = true;
			},
			function() {
				return Tween(__image_alpha.set(1), 0, settings.time/2);
			},
			function() {
				instance_destroy();
			}
		]);
	}
	// Ongoing
	else {
		surface_set_target(_targetSurface);
		draw_surface_ext(after ? _toSurface : _fromSurface, 0, 0, 1, 1, 0, c_white, 1);
		draw_set_alpha(image_alpha);
		draw_set_colour(settings.colour);
		draw_rectangle(0, 0, surface_get_width(_targetSurface), surface_get_height(_targetSurface), false);
		draw_set_alpha(1);
		surface_reset_target();
	}
}
