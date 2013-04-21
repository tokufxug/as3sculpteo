package net3dprintweb.service.sculpteo.events
{
	import flash.events.Event;

	import net3dprintweb.service.sculpteo.upload.track.data.UploadDesignTrackingData;

	public class UploadDesignTrackingEvent extends Event
	{
		public static const TRACKING:String = "tracking";
		public var state:String;
		public var data:UploadDesignTrackingData;
		public function UploadDesignTrackingEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}