package net3dprintweb.service.sculpteo.events
{
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadFaultData;
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadResultData;

	import flash.events.Event;

	public class DirectUploadEvent extends Event
	{
		public static const RESULT:String = "result";
		public static const FAULT:String = "fault";
		public static const ERROR:String = "error";

		public var result:DirectUploadResultData;
		public var fault:DirectUploadFaultData;
		public var httpStatus:String;
		public function DirectUploadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}