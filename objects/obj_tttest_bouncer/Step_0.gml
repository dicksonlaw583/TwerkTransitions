///@desc Bounce
if (bbox_left <= 0 || bbox_right >= room_width) {
	hspeed = -hspeed;
}
if (bbox_top <= 0 || bbox_bottom >= room_height) {
	vspeed = -vspeed;
}
