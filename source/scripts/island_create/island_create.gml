///@function island_create
///@arg seed

var seed = undefined;

if( argument_count == 1 ) {
	seed = argument[0];
} else {
	randomise();
	seed = new_random_seed();
}

var seedVal = undefined;
if( is_real(seed) )
	seedVal = seed;
else
	seedVal = string_to_seed( seed );

random_set_seed( seedVal ); // Now given the same seed the same island should generate every time
/*
	SO LONG AS: Random numbers are collected in the same type/order
*/

with( instance_create_depth( 0, 0, 0, oIsland ) ) {
	self.seed = seed;
	self.seedReal = seedVal;
	
	size = oGenerator.size;
	featureSize = oGenerator.featureSize;
	valMin = oGenerator.valMin;
	valMax = oGenerator.valMax;
	
	rotation = 0;
	rotationSpeed = 360/(room_speed*60);
	
	special_seed_pre( id );

	noise = make_noise( size, featureSize, valMin, valMax, oGenerator.seedGrid );
	surface = noise_to_surface( noise );
	
	seaLevel = ((noise[NOISE.AVERAGE] - noise[NOISE.MIN]) / (noise[NOISE.MAX] - noise[NOISE.MIN]))*1.5;
	name = random_name();
	
	noise_to_island( noise, surface );
	
	special_seed_post( id );
	
	return id;
}