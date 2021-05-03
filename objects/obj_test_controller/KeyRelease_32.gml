///@desc Change Rooms
room_transition((room == rm_tttest_island) ? rm_tttest_plains : rm_tttest_island, types[currentType][1], __tt_merge_options__({ time: time }, types[currentType][2]));
