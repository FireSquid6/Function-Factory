function instances_in_cell(_cellx, _celly, _obj, _notme)
{
	var sizeminusone = CELL_SIZE - 1
	var pixx = _cellx * CELL_SIZE
	var pixy = _celly * CELL_SIZE
	var list = ds_list_create()
	
	collision_rectangle_list(pixx, pixy, pixx + sizeminusone, pixy + sizeminusone, _obj, false, _notme, list, false)
	if ds_list_size(list) > 0 return list else return 0
}