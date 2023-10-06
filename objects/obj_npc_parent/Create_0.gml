// Inherit the parent event
event_inherited();

// Variable Definitions
/* 
default_dialogue --> refers to the text_id from scr_game_text
has_speech_bubble --> boolean that sets if the NPC should show a speech bubble
npc_type --> refers to the 'e_npc_types' enumerator
npc_role --> refers to the 'e_npc_roles' enumerator
enemy_id --> refers to the 'global.enemies' struct. Atm, defaults to Zino
*/

// Depth Sorting
SetDepth(0);