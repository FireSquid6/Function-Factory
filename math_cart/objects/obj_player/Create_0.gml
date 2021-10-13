#macro CELL_SIZE 64
enum BORDER_COLORS
{
	RAIL = c_yellow,
	DELETING = c_red,
	PLACING = c_aqua,
	NONE = c_gray
}
show_debug_message("Player has been created")

toolbar = ["eraser", "rail", "wire"]
gizmobox = []
tool_selected = 0

cell_x = 0
cell_y = 0
border_color = BORDER_COLORS.RAIL