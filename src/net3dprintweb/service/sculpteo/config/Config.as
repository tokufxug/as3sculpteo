package net3dprintweb.service.sculpteo.config
{
	import net3dprintweb.service.sculpteo.code.Language;

	public class Config
	{
		private static const DEFAULT_HOST:String = "sculpteo.com";
		public var language:String = Language.ENGLISH;
		public var isSSL:Boolean = true;

		public function changeLaguage(value:String):void {
			language = value;
		}

		public function get URL():String {
			var scheme:String = isSSL ? "https://" : "http://";
			var host:String =  "www." + DEFAULT_HOST +"/" + language + "/";
			return scheme + host;
		}
	}
}