/// Invisible collision layer 
var lay_id1 = layer_get_id("Collision");
//var lay_id2 = layer_get_id("Triggers");

if layer_get_visible(lay_id1)
{
    layer_set_visible(lay_id1, false);
}

/*
if layer_get_visible(lay_id2)
{
    layer_set_visible(lay_id2, false);
}
*/
