///@function k3d_end

gpu_set_zwriteenable(false);				// Disable depth sorting
gpu_set_ztestenable(false)					// Don't check z-depth before drawing
	
gpu_set_texrepeat(false);					// Disables texture repeating
gpu_set_alphatestenable(false);				// Disables transparency in textures