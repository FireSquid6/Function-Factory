//draw where the grid is
shape = CleanRectangle(pixel_x, pixel_y, pixel_x + CELL_SIZE, pixel_y + CELL_SIZE)
shape.Blend(c_white, 0)
shape.Border(8, border_color, 0.75)
shape.Draw()