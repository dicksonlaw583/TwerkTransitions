///@func tt_flip_horizontal()
///@desc Simple horizontal flip
function tt_flip_horizontal() {
	var _halfWidth = surface_get_width(application_surface)/2;
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			spinType: te_swing,
			spins: 1,
		}, params);
		spinTheta = 0;
		__tt_tween__(InstanceVar("spinTheta"), (-1+2*settings.spins)*pi, settings.time, settings.spinType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		var realCos = cos(spinTheta);
		var absCos = abs(realCos);
		var _fullHeight = surface_get_height(application_surface);
		draw_surface_stretched_ext((realCos > 0) ? fromSurface : application_surface, lerp(_halfWidth, 0, absCos), 0, absCos*2*_halfWidth, _fullHeight, c_white, image_alpha);
		surface_reset_target();
	}
}

///@func tt_flip_vertical()
///@desc Simple vertical flip
function tt_flip_vertical() {
	var _halfHeight = surface_get_height(application_surface)/2;
	// Initialize
	if (!ready) {
		settings = __tt_merge_options__({
			time: TWERK_TRANS_DURATION,
			spinType: te_swing,
			spins: 1,
		}, params);
		spinTheta = 0;
		__tt_tween__(InstanceVar("spinTheta"), (-1+2*settings.spins)*pi, settings.time, settings.spinType);
		Delay(settings.time, function() {
			instance_destroy();
		});
	}
	// Ongoing
	else {
		surface_set_target(overlaySurface);
		var realCos = cos(spinTheta);
		var absCos = abs(realCos);
		var _fullWidth = surface_get_width(application_surface);
		draw_surface_stretched_ext((realCos > 0) ? fromSurface : application_surface, 0, lerp(_halfHeight, 0, absCos), _fullWidth, absCos*2*_halfHeight, c_white, image_alpha);
		surface_reset_target();
	}
}
