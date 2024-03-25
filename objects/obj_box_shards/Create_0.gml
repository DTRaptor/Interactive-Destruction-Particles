hsp = 0;
vsp = 0;
//Gravity.
grv_default = 0.4;
grv = grv_default;

// How quickly a bounce stops. Values closer to one are bouncier.
decay = 0.01;

//Air resistance.
resistance = 0.01;
//Friction.
fric = 0.1;

//The speed of the debris. Multiply this number with the speed of the bullet to get the speed of the debris.
impact_damp = 0.1;

//Randomise the angle at which the debris flies.
angle_range = 15;

//How long it takes for a particle to despawn after no a collision without any further bounces.
expiry_time = 200;

//How long it takes for the shard to stop spinning.
turn_decay = 10;

alarmed = false;

if(place_meeting(x+hsp, y, obj_indes)) {
	hsp *= -decay;
	if !alarmed alarm[0] = expiry_time; alarmed = true;
}

if(place_meeting(x, y+vsp, obj_indes)) {
	vsp *= -decay;
	if !alarmed alarm[0] = expiry_time; alarmed = true;
}

my_angle = image_angle;