package net3dprintweb.service.sculpteo.config
{
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadResultData;

	public class UploadDesignTrackingConfig extends Config
	{
		public function UploadDesignTrackingConfig()
		{
		}

		public override function get URL():String {
			return super.URL + "upload_progress/?X-Progress-ID=";
		}
	}
}