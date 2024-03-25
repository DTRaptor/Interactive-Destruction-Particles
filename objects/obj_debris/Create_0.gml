hsp = 0;
vsp = 0;
//Gravity.
grv_default = 0.2;
grv = grv_default;

// How quickly a bounce stops. Values closer to one are bouncier.
decay = 0.1;

//Air resistance.
resistance = 0.01;
//Friction.
fric = 0.1;

//The speed of the debris. Multiply this number with the speed of the bullet to get the speed of the debris.
impact_damp = 0.5;

//Randomise the angle at which the debris flies.
angle_range = 15;

//
size_range = 0.5;

//How long it takes for a particle to despawn after no a collision without any further bounces.
expiry_time = 200;

alarmed = false;