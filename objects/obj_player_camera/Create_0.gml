#region variaveis
    // controle
    view_camera[1]      = camera_create_view(0, 0, 180, 320);   // camera que vai seguir o jogador 
    player_camera       = view_camera[1];                       // guardando posição da camera
    player_camera_up    = -room_height/2;                       // quantidade inicial para somar a subida
    go_up_camera        = false;                                // se devo ou não subir
    player_camera_roll  = camera_get_view_y(view_camera[player_camera]);    // posição y da camera 
   

#endregion

#region metodos
    // seguir o jogador
    follow_player = function()
    {
        // só sigo o jogador se ele existir
        if (!object_exists(obj_player) || !instance_exists(obj_player)) exit;
        var _player = obj_player;   // jogador 
 
        if (_player.y <= player_camera_roll){
         if player_camera_roll > player_camera_up {
                camera_set_view_pos(view_camera[player_camera], 0, player_camera_roll)  // atribuindo valor de subida na camera
                player_camera_roll = lerp(player_camera_roll, player_camera_up, .1);    // aumentando o valor de subida de forma graduativa
            }
            else{
                go_up_camera = false;                   // quando aumentar a camera subir até o valor certo ela deve parar
                player_camera_up -= room_height/2;      // aumentando o valor para o próxima subida
            }        }
    }
#endregion