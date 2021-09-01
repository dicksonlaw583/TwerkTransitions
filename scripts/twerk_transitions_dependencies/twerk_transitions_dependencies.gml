/// Make sure GMTwerk 2 is installed
if (asset_get_index("__gmtwerk_host__") < 0) {
	show_error("Twerk Transitions error: Cannot detect GMTwerk 2.\n\nPlease install GMTwerk 2 from the YoYo Marketplace:\n\nhttps://marketplace.yoyogames.com/assets/9666/gmtwerk-2\n\nOr GitHub:\n\nhttps://github.com/dicksonlaw583/GMTwerk2/releases", true);
}
