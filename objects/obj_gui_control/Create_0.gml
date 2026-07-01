#region metodos
    draw_total_drops = function (_text = "DROPS: ")
    {
        draw_set_font(fnt_capivara_jumper); 
        draw_set_colour(c_black);
        draw_text(40, 40, _text +string(global.total_drops)); 
        // resetando padrões
        draw_set_font(-1); 
        draw_set_colour(-1);     
    }
#endregion
