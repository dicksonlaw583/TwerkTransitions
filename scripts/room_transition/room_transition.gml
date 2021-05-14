///@func room_transition(targetedRoom, <kernel>, <params>)
///@param {Room} targetedRoom The room to go to
///@param {function} <kernel> (Optional) The transition kernel to use
///@param {strc} <params> (Optional) Parameters to give to the transition
///@desc Change to the target room with transitions enabled
function room_transition(_targetedRoom) {
	var _kernel = (argument_count > 1) ? argument[1] : TWERK_TRANS_DEFAULT;
	var _params = (argument_count > 2) ? argument[2] : TWERK_TRANS_OPTIONS;
	if (instance_exists(__obj_twerk_transitions__)) {
		if (__obj_twerk_transitions__.ready) {
			room_goto(_targetedRoom);
		} else {
			__obj_twerk_transitions__.targetedRoom = _targetedRoom;
		}
	} else {
		with (instance_create_depth(0, 0, TWERK_TRANS_DEPTH, __obj_twerk_transitions__)) {
			targetedRoom = _targetedRoom;
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

///@func __tt_tween__(selector, target, time, type)
///@param {GMTwerkSelector} selector The selector to work with
///@param {real} target The target value
///@param {real|int64} time The time to get there in milliseconds (real) or steps (int64)
///@param {struct|array|script} type An animation curve struct, a 2-tuple array of an animation curve and a channel name, or a tween equation script
///@desc Set up and return a tweening actor for the given type
function __tt_tween__(_selector, _target, _time, _type) {
	if (is_struct(_type) || is_array(_type)) {
		return ChannelTween(_selector, _target, _time, _type);
	}
	return Tween(_selector, _target, _time, ["type", _type]);
}
