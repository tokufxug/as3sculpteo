package net3dprintweb.service.sculpteo.materials
{
	public class PaintedResin
	{
		public static const NEON_YELLOW:String = "resin_painted_neon_yellow";
		public static const NEON_ORANGE:String = "resin_painted_neon_orange";
		public static const NEON_PINK:String = "resin_painted_neon_pink";
		public static const INTENSE_RED:String = "resin_painted_intense_red";
		public static const ORANGE:String = "resin_painted_orange";
		public static const MARRON_GLACE:String = "resin_painted_marron_glace";
		public static const PEARL_GRAY:String = "resin_painted_pearl_gray";
		public static const ODYSSEY_BLUE:String = "resin_painted_odyssey_blue";
		public static const VALLEY_GREEN:String = "resin_painted_valley_green";
		public static const LIGHT_YELLOW:String = "resin_painted_light_yellow";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(NEON_YELLOW);
			ret.push(NEON_ORANGE);
			ret.push(NEON_PINK);
			ret.push(INTENSE_RED);
			ret.push(ORANGE);
			ret.push(MARRON_GLACE);
			ret.push(PEARL_GRAY);
			ret.push(ODYSSEY_BLUE);
			ret.push(VALLEY_GREEN);
			ret.push(LIGHT_YELLOW);
			return ret;
		}
	}
}