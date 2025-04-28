// --- Fade from black
if (fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}

// --- Draw dialogue box
if (dialogue_visible) {
    var margin = 20;
    var box_width = display_get_gui_width() - margin * 2;
    var box_height = 100;
    var box_x = margin;
    var box_y = display_get_gui_height() - box_height - margin;

    // Dialogue background
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);

    // Speaker
    if (dialogue_speaker != "") {
        draw_set_color(c_white);
        draw_text(box_x + 10, box_y + 10, dialogue_speaker + ":");
    }

    // Dialogue text
    draw_set_color(c_white);
    draw_text(box_x + 10, box_y + 40, displayed_text);

    // Show "Press SPACE" if ready
    if (typewriter_index >= string_length(current_dialogue)) {
        draw_set_color(c_white);
        draw_text(display_get_gui_width() - 150, display_get_gui_height() - 30, "[Press SPACE]");
    }
}

// --- Draw choice menu
if (choice_active) {
    var margin = 20;
    var box_width = display_get_gui_width() - margin * 2;
    var box_height = 150;
    var box_x = margin;
    var box_y = display_get_gui_height() - box_height - margin - 120; // Higher than dialogue box

    // Choices background
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);

    // Draw options
    draw_set_color(c_white);
    for (var i = 0; i < array_length(choice_options); i++) {
        var text_x = box_x + 10;
        var text_y = box_y + 10 + i * 40;

        if (i == choice_selected) {
            draw_text(text_x - 10, text_y, "► " + choice_options[i]);
        }
        else {
            draw_text(text_x, text_y, choice_options[i]);
        }
    }
}
