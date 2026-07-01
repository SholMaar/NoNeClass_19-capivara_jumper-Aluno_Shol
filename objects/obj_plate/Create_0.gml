y_text_align	= y +sprite_height /2; 
x_text_align	= x +sprite_width /2;
text			= "Jogar";
color			= c_black;

plate_settings	= function()
{
	var _box_xplate		= clamp(mouse_x, x, x +sprite_width)
	var _box_yplate		= clamp(mouse_y, y, y +sprite_height)
	var _mouse_enter	= mouse_x == _box_xplate && mouse_y == _box_yplate; 
	var _mouse_click	= mouse_check_button_pressed(mb_left);
	
	if (_mouse_enter)	// checagem para saber se meu mouse entrou na box da sprite
		color = c_yellow;
	else
		color = c_black;
		
	if (_mouse_enter && _mouse_click)
		room_goto(rm_gameplay);
	
	show_debug_message(_box_xplate)
}