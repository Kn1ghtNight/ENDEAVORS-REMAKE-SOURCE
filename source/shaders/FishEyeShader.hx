package shaders;

import flixel.system.FlxAssets.FlxShader;

class FishEyeShader extends FlxShader // https://www.shadertoy.com/view/WsVSzV
{
		@:glFragmentSource('        
        #pragma header
        vec2 uv = openfl_TextureCoordv.xy;
        vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
        vec2 iResolution = openfl_TextureSize;
        #define iChannel0 bitmap

        vec3 checker(vec2 uv){
             return vec3(abs(floor(mod(uv.x*10.,2.))-floor(mod(uv.y*10.,2.))));   
        }
        
        void main()
        {
            vec2 uv = fragCoord.xy*2. / iResolution.xy-vec2(1.);
            
            //------------------------------------------------
            // To use in Godot, port this section:
            //------------------------------------------------
            
            // I picked these somewhat arbitrarily
            const float BARREL = -1.0;
            const float PINCUSHION = 0.0001;
            
            float effect = PINCUSHION; // Set effect to either BARREL or PINCUSHION
            float effect_scale = 1.0;  // Play with this to slightly vary the results
            
            /// Fisheye Distortion ///
            float d=length(uv);
            float z = sqrt(1.0 + d * d * effect);
            float r = atan(d, z) / 3.14159;
            r *= effect_scale;
            float phi = atan(uv.y, uv.x);
            
            uv = vec2(r*cos(phi)+.5,r*sin(phi)+.5);
            
            //------------------------------------------------
            // end relevant logic
            //------------------------------------------------
            
            gl_fragColor = vec4(checker(uv),1.);
        }
		')

	public function new()
	{
		super();
	}
}