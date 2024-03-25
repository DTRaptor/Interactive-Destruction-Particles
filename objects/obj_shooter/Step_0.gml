#region Movement
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
var _mx = right - left;
var _my = down - up;

hsp = _mx * msp;
vsp = _my * msp;

if(place_meeting(x+hsp, y, obj_col)) {
	while(!place_meeting(x+sign(hsp), y, obj_col)) {
		x += sign(hsp);
	}
	hsp = 0;
}

if(place_meeting(x, y+vsp, obj_col)) {
	while(!place_meeting(x, y+sign(vsp), obj_col)) {
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;
#endregion

shoot_dir = point_direction(x, y, mouse_x, mouse_y);
shoot = mouse_check_button_pressed(mb_left);

if(shoot){
	with(instance_create_layer(x, y, "Instances", obj_bullet)) {
		spd = other.shoot_speed;
		direction = other.shoot_dir;
		image_angle = direction;
		show_debug_message(direction);
	}
}