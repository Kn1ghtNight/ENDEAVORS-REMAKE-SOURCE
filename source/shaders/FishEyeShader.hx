package shaders;

// i think https://www.shadertoy.com/view/wtBXRz
// i dont remember the exact shader I based this on -neb

import flixel.system.FlxAssets.FlxShader;

class FishEyeEffect
{
	public var shader:FishEyeShader = new FishEyeShader();

	@:isVar
	public var fisheyeDistortion1(get, set):Float = 0;
	@:isVar
	public var fisheyeDistortion2(get, set):Float = 0;

	function get_fisheyeDistortion1()
		return shader.fisheyeDistortion1;

	function set_fisheyeDistortion1(val:Float)
		return shader.fisheyeDistortion1 = val;

	function get_fisheyeDistortion2()
		return shader.fisheyeDistortion2;

	function set_fisheyeDistortion2(val:Float)
		return shader.fisheyeDistortion2 = val;
    
	public function new()
	{
		shader.fisheyeDistortion1  = 0;
		shader.fisheyeDistortion2 = 0;
	}


}
class FishEyeShader extends FlxShader {
	@:isVar
	public var fisheyeDistortion1(get, set):Float = 0;
	@:isVar
	public var fisheyeDistortion2(get, set):Float = 0;


	function get_fisheyeDistortion1()
		return dis1.value[0];
	

	function set_fisheyeDistortion1(val:Float)
		return dis1.value[0] = val;
	

	function get_fisheyeDistortion2()
		return dis2.value[0];
	
	function set_fisheyeDistortion2(val:Float)
		return dis2.value[0] = val;
	

    @:glFragmentSource('
        #pragma header
        const float PI_F = 3.141592653589793;
        uniform float dis1;
        uniform float dis2;
        vec2 brownConradyDistortion(vec2 uv)
        {
            // positive values of K1 give barrel distortion, negative give pincushion
            float r2 = uv.x*uv.x + uv.y*uv.y;
            uv *= 1.0 + dis1 * r2 + dis2 * r2 * r2;
            
            // tangential distortion (due to off center lens elements)
            // is not modeled in this function, but if it was, the terms would go here
            return uv;
        }

        void main()
        {
            vec2 unmodifiedUv = openfl_TextureCoordv;
            vec2 uv = openfl_TextureCoordv;
            uv -= .5;

            uv = brownConradyDistortion(uv);

            uv += .5;

            if(uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0){
                gl_FragColor = vec4(0.0);
                return;
            }
            
            gl_FragColor = flixel_texture2D(bitmap, uv);
        }

    ')
    public function new() {
        super();
		dis1.value = [0.0];
		dis2.value = [0.0];
    }
}