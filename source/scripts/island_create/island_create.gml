///@function island_create
///@arg seed

var seed = undefined;

if( argument_count == 1 ) {
	seed = argument[0];
} else {
	randomise();
	seed = new_random_seed();
}
	
if( is_string(seed) )
	var seedVal = string_to_seed( seed );
else
	var seedVal = seed;

log( "Old Seed: "+string(random_get_seed()) );
log( "New Seed: '"+string(seed)+"' ("+string(seedVal)+")" );
random_set_seed( seedVal ); // Now given the same seed the same island should generate every time
log( "New Seed: "+string(random_get_seed()) );
/*
	SO LONG AS: Random numbers are collected in the same type/order
*/

with( instance_create_depth( 0, 0, 0, oIsland ) ) {
	size = oGenerator.size;
	featureSize = oGenerator.featureSize;
	valMin = oGenerator.valMin;
	valMax = oGenerator.valMax;
	
	rotation = 0;
	rotationSpeed = 360/(room_speed*60);

	noise = make_noise( size, featureSize, valMin, valMax, oGenerator.seedGrid );
	surface = noise_to_surface( noise );
	noise_to_island( noise, surface );

	seaLevel = ((noise[NOISE.AVERAGE] - noise[NOISE.MIN]) / (noise[NOISE.MAX] - noise[NOISE.MIN]))*1.5;
	
	
	name = random_name();
	self.seed = seed;
	return id;
}