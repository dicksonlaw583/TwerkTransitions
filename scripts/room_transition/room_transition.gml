///@func room_transition(targetRoom, [kernel], [params])
///@param {Asset.GMRoom} targetRoom The room to go to
///@param {function} [kernel] (Optional) The transition kernel to use
///@param {struct,undefined} [params] (Optional) Parameters to give to the transition
///@desc Change to the target room using TwerkTransitions
function room_transition(targetRoom, kernel=TWERK_TRANS_DEFAULT, params=TWERK_TRANS_OPTIONS) {
	if (instance_exists(__obj_twerk_transitions__)) {
		if (__obj_twerk_transitions__.ready) {
			room_goto(targetRoom);
		} else {
			__obj_twerk_transitions__.targetedRoom = targetRoom;
		}
	} else {
		var inst = instance_create_depth(0, 0, TWERK_TRANS_DEPTH, __obj_twerk_transitions__);
		inst.targetedRoom = targetRoom;
		inst.kernel = kernel;
		inst.params = params;
	}
}

///@func __tt_merge_options__(defaults, params)
///@param {struct} defaults The original defaults
///@param {struct,undefined} params The incoming parameters
///@ignore
///@desc (INTERNAL: TwerkTransitions) Merge the parameters into defaults
function __tt_merge_options__(defaults, params) {
	if (is_struct(params)) {
		var keys = variable_struct_get_names(params);
		for (var i = array_length(keys)-1; i >= 0; --i) {
			var key = keys[i];
			var paramValue = variable_struct_get(params, key);
			if (is_struct(paramValue) && variable_struct_exists(defaults, key) && is_struct(variable_struct_get(defaults, key))) {
				__tt_merge_options__(variable_struct_get(defaults, key), paramValue);
			} else {
				variable_struct_set(defaults, key, paramValue);
			}
		}
	}
	return defaults;
}

///@func __tt_tween__(selector, target, time, type)
///@param {Struct.GMTwerkSelector} selector The selector to work with
///@param {real} target The target value
///@param {real} time The time to get there in milliseconds (real) or steps (int64)
///@param {struct,array,function} type An animation curve struct, a 2-tuple array of an animation curve and a channel name, or a tween equation script
///@ignore
///@desc (INTERNAL: TwerkTransitions) Set up and return a tweening actor for the given type
function __tt_tween__(selector, target, time, type) {
	if (is_struct(type) || is_array(type)) {
		return ChannelTween(selector, target, time, type);
	}
	return Tween(selector, target, time, ["type", type]);
}
