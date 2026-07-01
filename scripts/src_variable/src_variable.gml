function call_camera_variable(){
	// camera
	    player_camera           = view_camera[1]; // camera que sobe com o jogador
	    player_camera_height    = camera_get_view_height(player_camera);    // altura da camera
	    player_camera_widght    = camera_get_view_width(player_camera);     // largura camera
	    player_camera_y         = camera_get_view_y(player_camera);         // posição y atual da origem da camera
}