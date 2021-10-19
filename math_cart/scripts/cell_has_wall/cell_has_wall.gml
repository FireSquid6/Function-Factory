function cell_has_wall(_cellx, _celly)
{
	return (tilemap_get_at_pixel(global.wall_map, _cellx * CELL_SIZE, _celly * CELL_SIZE) > 0)
}