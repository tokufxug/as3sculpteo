package net3dprintweb.service.sculpteo.materials
{
	public class Plastic
	{
		public static const BLACK:String ="black_plastic";
		public static const BLUE:String ="blue_plastic";
		public static const BROWN:String ="brown_plastic";
		public static const GREEN:String ="green_plastic";
		public static const RED:String = "red_plastic";
		public static const ORANGE:String ="orange_plastic";
		public static const PINK:String ="pink_plastic";
		public static const BEIGE:String ="beige_plastic"
		public static const WHITE:String ="white_plastic";
		public static const YELLOW:String ="yellow_plastic";
		public static const COLOR:String ="color_plastic";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(BLACK);
			ret.push(BLUE);
			ret.push(BROWN);
			ret.push(GREEN);
			ret.push(RED);
			ret.push(ORANGE);
			ret.push(PINK);
			ret.push(BEIGE);
			ret.push(WHITE);
			ret.push(YELLOW);
			ret.push(COLOR);
			return ret;
		}
	}
}