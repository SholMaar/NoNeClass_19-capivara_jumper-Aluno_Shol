#region variaveis
	// camera
		call_camera_variable();

    // controle
        last_yposition          = y;
        global.last_yplataform  = last_yposition;

    // dados
        dice_drop_chance        = 100;
		
	// drops
		my_drop					= noone;

    // outras plataformas
        // mover
            move                = false;
            platform_speed      = choose(-1.5, -1.5);
		// sumir
			disappear			= false;
		
	// debug
		//sprite_index = spr_leaf_hplatform;
		
#endregion

#region metodos
	#region drops
	    creat_drop = function()
	    {
	        var _roll_dice = irandom(dice_drop_chance);
	        if (_roll_dice > 70){ // 30%
	            if (!object_exists(obj_drop)) exit;
	            var _drop = instance_create_layer(x, y, "Drops", obj_drop); // drop que essa plataforma criou
				my_drop = _drop;	// salvando o drop que pertence a essa plataforma
	        }
	    }
	
		// fazer o drop seguir a plataforma
		drop_follow = function()
		{
			with(my_drop) // mexendo no código da instancia do meu drop
			{
				if instance_exists(other)
				{
					hspeed = other.hspeed;	// acompanhando a velocidade da plataforma pertencente
					image_alpha = other.image_alpha;
				}
			}
		}
	#endregion
	
    // mover plataforma
    move_platform = function ()
    {       
		var _half_widht = sprite_width/2;
        move = true;				// dizendo que eu me movo
		
        if (move) {					// se eu posso me omver
        	if (x <= _half_widht || x >= player_camera_widght -_half_widht)
				platform_speed *= -1;	// mudando direção 
			x = clamp(x, 0 +_half_widht, player_camera_widght -_half_widht);	// limitando meu movimento
        }
		hspeed = platform_speed;	// aplicando velocidade
    }
	
	false_platform = function ()
	{
		if (disappear)
		{
			image_alpha = lerp(image_alpha, 0, .1); // desaparecendo
			if (image_alpha < .1)
			{	
				instance_destroy(id, false); // destruindo a plataforma
				instance_destroy(my_drop, false); // destruindo o drop da plataforma
			}
		}
	}
	
	// maquina de estado da plataforma
	state_machine_platform = function ()
	{
		switch sprite_index
		{
			case spr_mechanical_hplatform:
			{		
				move_platform();		// movendo a plataforma
			}break;
			
			case spr_leaf_hplatform:
			{		
				false_platform();		// movendo a plataforma
			}break;
		}
	}
	
#endregion

#region chamada de metodos
    creat_drop();

#endregion