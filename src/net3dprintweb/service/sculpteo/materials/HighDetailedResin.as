package net3dprintweb.service.sculpteo.materials
{
	public class HighDetailedResin
	{
		public static const WHITE:String = "high_detailed_resin";
		public static const BLACK:String = "black_high_detailed_resin";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(WHITE);
			ret.push(BLACK);
			return ret;
		}
	}
}