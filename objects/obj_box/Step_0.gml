if (var_health <= 0) {
	var _boxshard = 0;
	repeat (4) {
		_boxshard ++;
		with(instance_create_layer(x, y, "Decals", obj_box_shards)) {
			var _box = other.id;
			hsp = _box.bullet_id.hsp * abs(_box.bullet_id.nx);
			vsp = _box.bullet_id.vsp * abs(_box.bullet_id.ny);
			
			image_index = _boxshard;
			
			aim_dir = point_direction(0, 0, hsp, vsp);
			
			
			turnspeed = hsp * 0.1;
			
			aim_dir += random_range(-angle_range * 2, angle_range *  2);
			hsp = lengthdir_x(other.bullet_id.spd * impact_damp, aim_dir);
			vsp = lengthdir_y(other.bullet_id.spd * impact_damp, aim_dir);
		}
	}
	instance_destroy();
}