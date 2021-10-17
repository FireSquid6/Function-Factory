function instances_in_cell(_cellx, _celly, _obj, _notme)
{
	var sizeminusone = CELL_SIZE - 1
	var pixx = _cellx * CELL_SIZE
	var pixy = _celly * CELL_SIZE
	var list = ds_list_create()
	
	collision_rectangle_list(pixx, pixy, pixx + CELL_SIZE, pixy + CELL_SIZE, _obj, false, _notme, list, false)
	return list
}