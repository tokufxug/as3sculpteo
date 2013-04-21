package net3dprintweb.service.sculpteo.mapper
{
	import com.laiyonghao.Uuid;

	import flash.net.URLVariables;
	import flash.utils.ByteArray;

	import net3dprintweb.service.sculpteo.code.Customizable;
	import net3dprintweb.service.sculpteo.code.PrintAuthorization;
	import net3dprintweb.service.sculpteo.code.Share;
	import net3dprintweb.service.sculpteo.info.Account;
	import net3dprintweb.service.sculpteo.upload.data.DesignData;
	import net3dprintweb.service.sculpteo.upload.data.Rotation;
	import net3dprintweb.service.sculpteo.utils.SculpteoUtil;

	public class URLVariablesMapper
	{
		public static const DESIGNER:String = "designer";
		public static const PASSWORD:String = "password";
		public static const LIST:String = "list";
		public static const TRACK_ID:String = "trackid";

		public static const NAME:String ="name";
		public static const FILENAME:String ="filename";
		public static const FILE:String = "file";
		public static const DESC:String ="description";
		public static const KEYWORDS:String ="keywords";
		public static const SHARE:String ="share";
		public static const PRINT_AUTH:String ="print_authorization";
		public static const ALLOW:String ="allow";
		public static const CUSTOM:String ="customizable";
		public static const UNIT:String ="unit";
		public static const SCALE:String ="scale";
		public static const SIZES:String ="sizes";
		public static const MATERIALS:String ="materials";
		public static const ROTATION:String ="rotation";

		public static function mapping(data:DesignData, account:Account = null):URLVariables {
			var ret:URLVariables = null;
			var trackId:String = null;
			ret = createDefaultURLVariables(data);

			if (account) {
					setProperty(ret, DESIGNER, account.designer);
					setProperty(ret, PASSWORD, account.password);
					trackId = account.trackId;
			}
			if (trackId == null || trackId.length < 8) {
				trackId = new Uuid().toString();
			}
			ret[TRACK_ID] = trackId;
			return ret;
		}

		private static function createDefaultURLVariables(data:DesignData):URLVariables {
			var v:URLVariables = new URLVariables();

			setProperty(v, NAME, data.name);
			setProperty(v, FILENAME, data.fileName);
			setProperty(v, FILE, data.file is ByteArray ? SculpteoUtil.encodeByteArray(data.file as ByteArray) :
				SculpteoUtil.encode(data.file as String));
			setProperty(v, DESC,  data.description);
			setProperty(v, KEYWORDS,data.keywords);
			setProperty(v, SHARE, data.isShares ? Share.YES : Share.NO);
			setProperty(v, PRINT_AUTH, data.isPrintAuthorization ? PrintAuthorization.YES : PrintAuthorization.NO);
			setProperty(v, CUSTOM,data.isCustomizable ? Customizable.YES : Customizable.NO);
			setProperty(v, UNIT, data.designUnit);
			setProperty(v, SIZES, toStringSizes(data.sizes));
			setProperty(v, MATERIALS, toStringMaterials(data.materials));
			setProperty(v, SCALE, data.scale);
			setProperty(v, ROTATION, toStringRotation(data.rotation));
			return v;
		}

		private static function setProperty(v:URLVariables, key:String, value:Object):void {
			if (value) {
				v[key] = value;
			}
		}

		private static function toStringSizes(value:Vector.<Number>):String {
			if (!value) {
				return null;
			}
			var len:int = value.length;
			var ret:String = "";
			for (var i:int =0; i < len; i++) {
				ret+=value[i] + ",";
			}
			return ret.substr(0, ret.length - 1);
		}

		private static function toStringMaterials(value:Vector.<String>):String {
			if (!value) {
				return null;
			}
			var len:int = value.length;
			var ret:String = "";
			for (var i:int =0; i < len; i++) {
				ret+=value[i] + ",";
			}
			return ret.substr(0, ret.length - 1);
		}

		private static function toStringRotation(rotation:Rotation):String {
			if (!rotation) {
				return null;
			}
			return rotation.x + "," + rotation.y + "," + rotation.z;
		}
	}
}