#region variaveis
	// controle
		gravity_force	= .1;		// força de gravidade 
        jump_force      = -4;       // força de pulo
        move_velocity   = 1;        // velocidade de movimentação
#endregion

#region metodos
	// configurações do jogador
	player_settings = function()
	{
		gravity = gravity_force;	// aplicando gravidade no player
        
        #region movimentação
            // variaeis de movimentação
            var _move_left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
            var _move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
            // aplicando função das teclas
            if (_move_left)                                 // para esquerda
                hspeed = -move_velocity;                    // aplicando velocidade
            else if (_move_right)                           // para direita
                hspeed = move_velocity;                     // aplicando velocidade
            else hspeed = lerp(hspeed, 0, .1);              // zerando velocidade
                
            // fazendo o jogador aparecer do outro lado da tela quando sair pela tela
            // variaveis de localização
            var _outside_right_room = room_width +sprite_width/2;   // saida pela direita
            var _outside_left_room  = 0 -sprite_width/2;            // saida pela esquerda
            // aplicando consição
            if (x < _outside_left_room)
                x = _outside_right_room-1;      // colocando -1 para ele não ficar preso
            else if (x > _outside_right_room)
                x = _outside_left_room+1;       // colocando +1 para evitar do ogador ficar preso
        #endregion
	}

    // configuração de salto
    player_jump = function()
    {
        // só posso saltar SE meu Y for <= que a plataforma E se minha velocidade é >= 0
        if (y <= other.y && vspeed >= 0)
            vspeed = jump_force     // diminuo o valor do vspeed oara ele saltar 
    }
#endregion