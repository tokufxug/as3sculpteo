package net3dprintweb.service.sculpteo.utils
{
	import com.hurlant.crypto.Crypto;
	import com.hurlant.crypto.hash.IHash;
	import com.hurlant.util.Base64;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	public class SculpteoUtil
	{
		public static function encode(value:String):String {
			var ret:String = value;
			ret = Base64.encode(ret);
			ret = ret.replace(/+/g, "_");
			ret = ret.replace(/\//g, "-");
			ret = ret.replace(/=/g, ".");
			return ret;
		}

		public static function encodeByteArray(value:ByteArray):String {
			var ret:String;
			ret = Base64.encodeByteArray(value);
			return ret;
		}

		public static function toHash(value:String):String {
			var hex:String = Hex.fromString(value);

			var b:ByteArray = new ByteArray();
			b = Hex.toArray(hex);

			var hash:IHash = Crypto.getHash("sha");

			var hb:ByteArray = hash.hash(b);

			return Hex.fromArray(hb);
		}
	}
}