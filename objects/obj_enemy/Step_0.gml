/// @description Insert description here
// You can write your code in this editor
if(movingRight){
	if(place_meeting(x+moveSpeed, y + 1, obj_collision_tiles)){
		x += moveSpeed;
	}
	else{
		movingRight = false;
	}
}
else {
	if(place_meeting(x-moveSpeed, y + 1, obj_collision_tiles)){
		x -= moveSpeed;
	}
	else{
		movingRight = true;
	}
}

if(!place_meeting(x, y + 1, obj_collision_tiles)){
	y += 1;
}