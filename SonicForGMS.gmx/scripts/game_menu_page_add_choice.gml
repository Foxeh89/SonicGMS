/// game_menu_page_add_choice(page, choice)

var page = argument0;
var choice = argument1;

if (instance_exists(page) and instance_exists(choice)) {
    choice.owner = page;
    choice.index = ds_list_size(page.choices);
    ds_list_add(page.choices, choice);
    if (choice.index == 0) {
        instance_perform_user_event(choice, 0); // select
    }
}
