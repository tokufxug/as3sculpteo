package net3dprintweb.service.sculpteo.materials
{
	public class Ceramic
	{
		public static const WHITE_GLOSSY:String = "ceramic_white_glossy";
		public static const OYSTER_BLUE:String ="ceramic_oyster_blue";
		public	static const ORANGE:String = "ceramic_tangerine_orange";
		public static const	TURQUOISE:String ="ceramic_turquoise";
		public static const AQUARIUS:String = "ceramic_aquarius_blue";
		public static const	 SATIN_BLACK:String ="ceramic_satin_black";
		public static const ANIS_GREEN:String ="ceramic_anis_green";
		public static const LEMON_YELLOW:String = "ceramic_lemon_yellow";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(WHITE_GLOSSY);
			ret.push(OYSTER_BLUE);
			ret.push(ORANGE);
			ret.push(TURQUOISE);
			ret.push(AQUARIUS);
			ret.push(SATIN_BLACK);
			ret.push(ANIS_GREEN);
			ret.push(LEMON_YELLOW);
			return ret;
		}
	}
}