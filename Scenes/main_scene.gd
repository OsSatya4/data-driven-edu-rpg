extends Node2D

func _ready():
	var tilemap = $Node2D/TileMapLayer
	var camera = $Node2D/Player/Camera2D
	
	var map_rect = tilemap.get_used_rect()
	var tile_size = Vector2(tilemap.tile_set.tile_size)
	
	var top_left = tilemap.to_global(Vector2(map_rect.position) * tile_size)
	var bottom_right = tilemap.to_global(Vector2(map_rect.end) * tile_size)
	
	camera.limit_left = int(top_left.x)
	camera.limit_top = int(top_left.y)
	camera.limit_right = int(bottom_right.x)
	camera.limit_bottom = int(bottom_right.y)
