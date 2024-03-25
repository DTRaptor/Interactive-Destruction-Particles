hsp = lengthdir_x(spd, direction);
vsp = lengthdir_y(spd, direction);

if(place_meeting(x + hsp, y, obj_col)) {
	nx = -sign(hsp);
	var _col_inst = instance_place(x + hsp, y, obj_col);
	if(_col_inst.object_index == obj_indes) hit_index = 0;
	else if(_col_inst.object_index == obj_box) {
		hit_index = 1; 
		_col_inst.var_health --;
		_col_inst.bullet_id = self
	}
}
if(place_meeting(x, y + vsp, obj_col)) {
	ny = -sign(vsp);
	var _col_inst = instance_place(x, y + vsp, obj_col);
	if(_col_inst.object_index == obj_indes) hit_index = 0;
	else if(_col_inst.object_index == obj_box) {
		hit_index = 1; 
		_col_inst.var_health --;
		_col_inst.bullet_id = self
	}
}

if(nx != 0 || ny != 0) {
	repeat(max(round(energy / 10), 0)) {
		with(instance_create_layer(x + hsp, y + vsp, "Instances", obj_debris)) {
			hsp = other.hsp * (abs(other.nx) * -1);
			vsp = other.vsp * (abs(other.ny) * -1);
			
			image_index = other.hit_index;
			
			aim_dir = point_direction(0, 0, hsp, vsp);
			
			size = random_range(0, size_range + other.energy / 400);
			image_xscale *= size;
			image_yscale *= size;
			turnspeed = hsp * 0.1 * size;
			
			grv_default *= size;
			grv = grv_default;
			
			aim_dir += random_range(-angle_range * ((size + 1) * 2), angle_range * ((size + 1) * 2));
			hsp = lengthdir_x(other.spd * impact_damp, aim_dir);
			vsp = lengthdir_y(other.spd * impact_damp, aim_dir);
		}
	}
	/*
	with(instance_create_layer(x + hsp, y + vsp, "Decals", obj_decal)) {
		nx = other.nx;
		ny = other.ny;
		image_angle = point_direction(0, 0, nx, ny) - 90;
		with(instance_place(x,y, obj_col)) {
			if(other.nx != 0) other.x = x + (other.nx * 32);
			
			if(other.ny != 0) other.y = y + (other.ny * 32);
		}
	}
	*/
	instance_destroy();
}

x += hsp;
y += vsp;

energy --;