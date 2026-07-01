function draw_text_plate(_x, _y, _text, _color)
{
	draw_set_font(fnt_capivara_jumper); // setando fonte 
    draw_set_colour(_color);			// cor do texto
	draw_set_halign(fa_middle);			// alinhamento
	draw_set_valign(fa_center);
	
	// desenhando texto
    draw_text(_x, _y, _text); 
	
    // resetando padrões
    draw_set_font(-1); 
    draw_set_colour(-1);   
	draw_set_halign(-1);
	draw_set_valign(-1);
}