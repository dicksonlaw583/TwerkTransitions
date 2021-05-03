///@desc Run twerks and handle surfaces

// Run twerks
gmtwerk_run();

// Keep surfaces alive
var guiWidth = surface_get_width(application_surface);
var guiHeight = surface_get_height(application_surface);
if (!surface_exists(fromSurface)) {
	fromSurface = surface_create(guiWidth, guiHeight);
	surface_set_target(fromSurface);
	draw_clear_alpha(c_black, 1);
	surface_reset_target();
}
if (!surface_exists(overlaySurface)) {
	overlaySurface = surface_create(guiWidth, guiHeight);
}

// Prepare fromSurface and toSurface
if (!ready) {
	surface_copy(fromSurface, 0, 0, application_surface);
	kernel();
	ready = true;
	room_goto(targetedRoom);
}

// Generate merged surface
surface_set_target(overlaySurface);
draw_clear_alpha(c_black, 1);
surface_reset_target();
var colourWrite = gpu_get_colorwriteenable();
gpu_set_colorwriteenable(true, true, true, false);
kernel(overlaySurface, fromSurface, application_surface);
gpu_set_colorwriteenable(colourWrite);
draw_surface(overlaySurface, 0, 0);
