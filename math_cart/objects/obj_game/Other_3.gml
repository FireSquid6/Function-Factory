//save user preferences
var str = json_stringify(global.user_preferences)
var buff = buffer_create(1, buffer_grow, 1)
buff = buffer_write(buff, buffer_string, str)

buffer_save(buff, SETTINGS_FILE_NAME)