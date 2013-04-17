package net3dprintweb.service.sculpteo.events
{
	import net3dprintweb.service.sculpteo.upload.data.DesignData;

	import flash.events.Event;

	public class SculpteoLoaderEvent extends Event
	{
		public static const COMPLETE:String = "com.print3dev.service.sculpteo.events.SculpteoLoaderEvent.Complete";
		public var data:DesignData;
		public function SculpteoLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}