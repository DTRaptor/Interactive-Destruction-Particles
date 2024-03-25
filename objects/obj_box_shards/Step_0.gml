vsp += grv;

if(place_meeting(x, y+1, obj_indes)) {
	hsp = approach(hsp, 0, fric);
	grv = 0;
	turnspeed = approach(turnspeed, 0, turn_decay)
}
else {
	hsp = approach(hsp, 0, resistance);
	grv = grv_default;
}

if(place_meeting(x+hsp, y, obj_indes)) {
	hsp *= -decay;
	if !alarmed alarm[0] = expiry_time; alarmed = true;
}

if(place_meeting(x, y+vsp, obj_indes)) {
	vsp *= -decay;
	if !alarmed alarm[0] = expiry_time; alarmed = true;
}

x += hsp;
y += vsp;
my_angle += turnspeed;

if(x < 0 || x > room_width || y < 0 || y > room_height) {
	instance_destroy();
}