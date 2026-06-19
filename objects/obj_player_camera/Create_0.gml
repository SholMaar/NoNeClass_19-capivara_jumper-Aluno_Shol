#region variaveis
    // camera
        view_camera[1]      = camera_create_view(0, 0, 180, 320);   // camera que vai seguir o jogador 
        player_camera       = view_camera[1];    // guardando posição da camera
        player_camera_hight = camera_get_view_height(player_camera) /2; // metade da altura da camera          
        player_camera_y     = camera_get_view_y(view_camera[player_camera]); // posição y da camera 
    // controle
        go_up_camera        = false; // se devo ou não subir
        up_camera_value     = 0;
   

#endregion

#region metodos
    // seguir o jogador
    follow_player = function()
    {
        // só sigo o jogador se ele existir
        if (!object_exists(obj_player) || !instance_exists(obj_player)) exit;
        var _player = obj_player;   // jogador 

        if (_player.y < player_camera_y) {
            go_up_camera            = true; // dizendo que minha camera pode subir 
            up_camepra_value        = player_camera_y -player_camera_hight; // valor de subida
            global.new_plataforms   = true; // posso criar plataformas novas
        }
        
        if go_up_camera{
            player_camera_y = lerp(player_camera_y, up_camepra_value, .1);  // subindo a camera
            camera_set_view_pos(view_camera[player_camera], 0, player_camera_y);
        }
    }
#endregion 