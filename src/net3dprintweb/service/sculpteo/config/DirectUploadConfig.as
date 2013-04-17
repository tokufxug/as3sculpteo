package net3dprintweb.service.sculpteo.config
{
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadResultData;

public class DirectUploadConfig extends Config
	{
		public function DirectUploadConfig()
		{
		}

		public override function get URL():String {
			return super.URL + "upload_design/a/3D/";
		}

		public function setDesignURL(result:DirectUploadResultData):void {
			result.url = "http://www.sculpteo.com/"
				+ language + "/design/" + result.name + "/" + result.uuid;
		}
	}
}