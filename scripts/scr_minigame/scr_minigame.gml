// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pings(){
	if !instance_exists(obj_ping)
	{
		instance_create_layer(self.x,self.y,"Instances",obj_ping);
	}
}

function ping_collision()
{

}



function reset_movement(){
		left = 0;
		right = 0;
		up = 0;
		down = 0;
}

function calc_movement(){
	var _hmove = right - left;
	var _vmove = down - up;
	
	if _hmove != 0 or _vmove != 0 {
		
		var _dir = point_direction(0,0,_hmove,_vmove);
		_hmove = lengthdir_x(movspd, _dir);
		_vmove = lengthdir_y(movspd, _dir);
		
		x += _hmove;
		y += _vmove;
	}
}

function get_input() {
	if keyboard_check(vk_up) up = 1;
	if keyboard_check(vk_down) down = 1;
	if keyboard_check(vk_left) left = 1;
	if keyboard_check(vk_right) right = 1;
}



function scr_minigame(){
	switch (room)
	{
		case rm_minigame:
		
			obj_minigame.nodes = instance_number(obj_node);
			randomize();
			
			for(var i=0; i < 36; i++)
			{
				if(i < 6)
				{
					instance_create_layer(32+32*i,32,"Instances",obj_node);
				}
				else if(i >= 6 and i < 12)
				{
					instance_create_layer(32+32*(i-6),64,"Instances",obj_node);
				}
				else if(i >= 12 and i < 18)
				{
					instance_create_layer(32+32*(i-12),96,"Instances",obj_node);
				}
				else if(i >= 18 and i < 24)
				{
					instance_create_layer(32+32*(i-18),128,"Instances",obj_node);
				}
				else if(i >= 24 and i < 30)
				{
					instance_create_layer(32+32*(i-24),160,"Instances",obj_node);
				}
				else if(i >= 30 and i < 36)
				{
					instance_create_layer(32+32*(i-30),192,"Instances",obj_node);
				}
				node_to_add = instance_find(obj_node,i);
				array_push(obj_minigame.nodes_array,node_to_add);
				array_shuffle_ext(obj_minigame.nodes_array);
			}
			if obj_minigame.difficulty = 1
			{
				with obj_minigame.nodes_array[0]
				{
					corrupt_node = true;
					if self.hit = true and self.marked = true
					{
						obj_minigame.timer_cond = false;	
					}
				}
			}
			else if obj_minigame.difficulty = 2
			{
				with obj_minigame.nodes_array[0]
				{
					corrupt_node = true;
				}
			with obj_minigame.nodes_array[1]
				{
					corrupt_node = true;
				}
			}
			
			
		break;
	}
}

function scr_minigame2()
{
	
}