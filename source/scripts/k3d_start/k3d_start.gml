///@function k3d_start

gpu_set_zwriteenable(true);					// Enable depth sorting via the Z-buffer
gpu_set_ztestenable(true)					// Stop hidden objects from being drawn
	
gpu_set_texrepeat(true);					// Enables texture repeating
gpu_set_alphatestenable(true);				// Allows transparency in textures