package net3dprintweb.service.sculpteo.materials
{
	public class PlasticPolished
	{
		public static const WHITE:String = "plastic_polished_white";
		public static const BLACK:String = 	"plastic_polished_black";
		public static const BLUE:String ="plastic_polished_blue";
		public static const YELLOW:String ="plastic_polished_yellow";
		public static const RED:String ="plastic_polished_red";
		public static const GREEN:String ="plastic_polished_green";
		public static const BEIGE:String = "plastic_polished_beige";
		public static const BROWN:String ="plastic_polished_brown";
		//public static const GREY:String ="plastic_polished_grey";
		public static const ORANGE:String ="plastic_polished_orange";
		public static const PINK:String ="plastic_polished_pink";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(BLACK);
			ret.push(BLUE);
			ret.push(BROWN);
			ret.push(GREEN);
			//ret.push(GREY);
			ret.push(RED);
			ret.push(ORANGE);
			ret.push(PINK);
			ret.push(BEIGE);
			ret.push(WHITE);
			ret.push(YELLOW);
			return ret;
		}
	}
}