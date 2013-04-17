package net3dprintweb.service.sculpteo.materials
{
	public class Other
	{
		public static const ALUMIDE:String ="alumide";
		public static const SILVER:String = "silver";

		public static function all():Vector.<String> {
			var ret:Vector.<String> = new Vector.<String>();
			ret.push(ALUMIDE);
			ret.push(SILVER);
			return ret;
		}
	}
}