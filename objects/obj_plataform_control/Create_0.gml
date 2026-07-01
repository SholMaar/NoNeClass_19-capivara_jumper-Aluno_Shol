#region variaveis
	// camera
		call_camera_variable();
    // controle
        first_plataforms        = true;     // devo criar ou não as plataformas iniciais
        plataform_ydistance     = 64;       // distancia de criação (64 px é a distancia mas começa no 0)
	// arrays
		platforms				= [spr_wood_hplatform, spr_leaf_hplatform, spr_mechanical_hplatform];
		total_platforms			= array_length(platforms) -1;

#endregion

#region metodos
    creat_platform = function()
    {
        if (!instance_exists(obj_wood_platform)) exit; // só consigo criar se o objeto existir
        var _platform           = obj_wood_platform; // plataforma
        var _plataform_xsprite  = _platform.sprite_width/2;
        
        // criando as primeiras plataformas 
        if (first_plataforms) {
            repeat (5) {
				// sprteando sprite
				var _sprite = irandom(total_platforms);
                // posição x
                var _x = irandom_range(0 +_plataform_xsprite, player_camera_widght -_plataform_xsprite) 
                // criando as plataformas
            	var _platforms = instance_create_layer(_x, global.last_yplataform -64, "Platforms", _platform)
				_platforms.sprite_index = platforms[_sprite];
            }
            first_plataforms = false; // já criei as minhas primeiras plataformas
        }
        
        // criando as plataformas quando a camera subir 
        if (global.new_plataforms)
        {
            repeat (3) {
				// sprteando sprite
				var _sprite = irandom(total_platforms);
                // posição x
                var _x = irandom_range(0 +_plataform_xsprite, player_camera_widght -_plataform_xsprite) 
                // criando as plataformas
            	var _platforms = instance_create_layer(_x, global.last_yplataform -64, "Platforms", _platform)
				_platforms.sprite_index = platforms[_sprite];
            }     
            global.new_plataforms = false;       
        }
    }

    destroy_platform = function ()
    {
        if (!instance_exists(obj_wood_platform)) exit; // só consigo criar se o objeto existir
        var _platform = obj_wood_platform; // plataforma
        // limite da camera a cada subida
        var _cam_limit_height = camera_get_view_y(view_camera[player_camera]) +camera_get_view_height(view_camera[player_camera]);
        
        if (_platform.y > _cam_limit_height) // se eu sair da vista da camera
            instance_destroy(_platform.id, false); // destruo a plataforma     
    }
#endregion