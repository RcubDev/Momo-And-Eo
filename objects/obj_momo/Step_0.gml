/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
var isOnGround = place_meeting(x,y + 1, obj_collision_tiles); //If pixel underneath player is an obj_collision_tile return true
//Movement below:
var move = key_right - key_left
if(move != 0) {
	nHorizSpeed += move * nAcceleration;
	nHorizSpeed = clamp(nHorizSpeed, -nMaxSpeed, nMaxSpeed)
}
else if(!isOnGround){
	nHorizSpeed = lerp(nHorizSpeed, 0, nFriction) //adding this will create an arc to jumps
}
else {
	nHorizSpeed = 0;
}

//nHorizSpeed = move * nAcceleration;

if(key_up && isOnGround){
	nVertSpeed -= 10;
}
nVertSpeed += nGravity

//Check collision horizontal...

if(place_meeting(x+nHorizSpeed, y, obj_collision_tiles)){ //If a collision check happens on a parent it checks all children too.
	while(!place_meeting(x+sign(nHorizSpeed), y, obj_collision_tiles)){
		x += sign(nHorizSpeed);	
	}
	nHorizSpeed = 0;
}

x += nHorizSpeed;
show_debug_message(nHorizSpeed)
//Check collisions verticle
if(place_meeting(x, y + nVertSpeed, obj_collision_tiles)){
	while(!place_meeting(x, y + sign(nVertSpeed), obj_collision_tiles)){
		y += sign(nVertSpeed);	
	}
	nVertSpeed = 0;
}


y += nVertSpeed;

