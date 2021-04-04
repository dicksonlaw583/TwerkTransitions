///@func room_transition(rmTarget, <kernel>, <params>)
///@param {Room} rmTarget The room to go to
///@param {function} <kernel> (Optional) The transition kernel to use
///@param {strc} <params> (Optional) Parameters to give to the transition
///@desc Change to the target room with transitions enabled
function room_transition(_rmTarget) {
	var _kernel = (argument_count > 1) ? argument[1] : TWERK_TRANS_DEFAULT;
	var _params = (argument_count > 2) ? argument[2] : undefined;
	if (instance_exists(__obj_twerk_transitions__)) {
		if (__obj_twerk_transitions__.ready) {
			room_goto(_rmTarget);
		} else {
			__obj_twerk_transitions__.rmTarget = _rmTarget;
		}
	} else {
		with (instance_create_depth(0, 0, TWERK_TRANS_DEPTH, __obj_twerk_transitions__)) {
			rmTarget = _rmTarget;
			kernel = _kernel;
			params = _params;
		}
	}
}

///@func __tt_merge_options__(defaults, params)
///@param {struct} defaults The original defaults
///@param {struct|undefined} params The incoming parameters
///@desc Merge the parameters into defaults
function __tt_merge_options__(_defaults, _params) {
	if (is_struct(_params)) {
		var keys = variable_struct_get_names(_params);
		for (var i = array_length(keys)-1; i >= 0; --i) {
			var key = keys[i];
			var paramValue = variable_struct_get(_params, key);
			if (is_struct(paramValue) && variable_struct_exists(_defaults, key) && is_struct(variable_struct_get(_defaults, key))) {
				__tt_merge_options__(variable_struct_get(_defaults, key), paramValue);
			} else {
				variable_struct_set(_defaults, key, paramValue);
			}
		}
	}
	return _defaults;
}

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
