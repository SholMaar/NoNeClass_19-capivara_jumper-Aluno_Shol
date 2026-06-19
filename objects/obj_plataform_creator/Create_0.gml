#region variaveis
    // camera
        player_camera           = view_camera[1]; // camera que sobe com o jogador
        player_camera_height    = camera_get_view_height(player_camera);    // altura da camera
        player_camera_widght    = camera_get_view_width(player_camera);     // largura camera
        player_camera_y         = camera_get_view_y(player_camera);         // posição y atual da origem da camera
    
    // controle
        first_plataforms        = true;     // devo criar ou não as plataformas iniciais
        plataform_ydistance     = 64;        // distancia de criação (64 px é a distancia mas começa no 0)

#endregion

#region metodos
    creat_platform = function()
    {
        if (!object_exists(obj_wood_platform)) exit; // só consigo criar se o objeto existir
            
        var _platform           = obj_wood_platform; // plataforma
        var _plataform_xsprite  = _platform.sprite_width/2;
        
        // criando as primeiras plataformas 
        if (first_plataforms) {
            repeat (5) {
                // posição x
                var _x = irandom_range(0 +_plataform_xsprite, player_camera_widght -_plataform_xsprite) 
                // criando as plataformas
            	instance_create_layer(_x, global.last_yplataform -64, "Platforms", _platform)
            }
            first_plataforms = false; // já criei as minhas primeiras plataformas
        }
        
        // criando as plataformas quando a camera subir 
        if (global.new_plataforms)
        {
            repeat (3) {
                // posição x
                var _x = irandom_range(0 +_plataform_xsprite, player_camera_widght -_plataform_xsprite) 
                // criando as plataformas
            	instance_create_layer(_x, global.last_yplataform -64, "Platforms", _platform)
            }     
            global.new_plataforms = false;       
        }
    }
#endregion