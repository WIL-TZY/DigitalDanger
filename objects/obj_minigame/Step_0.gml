/// @description Insert description here
// You can write your code in this editor

if self.timer_cond = true
{
	dt_value -= dt_time;
}

if self.threat > 0 and self.timer_cond = true
{
	threat -= 0.075;	
}

if self.threat > 100
{
	self.threat -= 20;
	self.attempts -= 1;
}

if self.attempts < 0
{
	room_restart();	
}

if self.attempts = 2 and instance_number(obj_attempt) = 0
{
	attempt_1 = instance_create_layer(240,208,"Instances",obj_attempt);
	attempt_2 = instance_create_layer(272,208,"Instances",obj_attempt);
	
}

if self.attempts = 2 and instance_number(obj_attempt) = 2
{
	with attempt_1
	{
		if self.image_index = 15
		{
			self.image_speed = 0;	
		}
	}
	with attempt_2
	{
		if self.image_index = 15
		{
			self.image_speed = 0;	
		}
	}
	
}
	

if self.attempts = 1
{
	with attempt_1
	{
		if self.image_index < 22
		{
			self.image_speed = 1;	
		}
		else
		{
			self.image_speed = 0	
		}
	}
}

if self.attempts = 0
{
	with attempt_1
	{
		if self.image_index < 22
		{
			self.image_speed = 1;	
		}
		else
		{
			self.image_speed = 0	
		}
	}
	with attempt_2
	{
		if self.image_index < 22
		{
			self.image_speed = 1;	
		}
		else
		{
			self.image_speed = 0	
		}
	}

}