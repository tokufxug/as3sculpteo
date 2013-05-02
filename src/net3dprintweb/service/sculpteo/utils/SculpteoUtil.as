package net3dprintweb.service.sculpteo.utils
{
	import com.hurlant.crypto.Crypto;
	import com.hurlant.crypto.hash.IHash;
	import com.hurlant.util.Base64;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	import nochump.util.zip.ZipEntry;
	import nochump.util.zip.ZipOutput;

	public class SculpteoUtil
	{
		public static function encode(value:String):String {
			var ret:String = value;
			ret = Base64.encode(ret);
			ret = ret.replace(/+/g, "_");
			ret = ret.replace(/=/g, "-");
			ret = ret.replace(/\//g, ".");
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

		public static function toZip(fileName:String, value:Object):String {
			var zipOut:ZipOutput = new ZipOutput();

			var data:ByteArray = null;
			switch (true) {
				case value is String:
					data = new ByteArray();
					data.writeUTFBytes(value as String);
					break;
				case value is ByteArray:
					return encodeByteArray(value as ByteArray);
					break;
			}
			zipOut.putNextEntry(new ZipEntry(fileName));
			zipOut.write(data);
			zipOut.closeEntry();
			zipOut.finish();
			return encodeByteArray(zipOut.byteArray);
		}
	}
}