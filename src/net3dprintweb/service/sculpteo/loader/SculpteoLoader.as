package net3dprintweb.service.sculpteo.loader
{
	import net3dprintweb.service.sculpteo.events.SculpteoLoaderEvent;
	import net3dprintweb.service.sculpteo.upload.data.DesignData;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	public class SculpteoLoader extends URLLoader
	{
		public function loadText(url:String):void {
			doLoad(url, URLLoaderDataFormat.TEXT, onLoadText);
		}

		public function loadZip(url:String):void {
			doLoad(url, URLLoaderDataFormat.BINARY, onLoadZip);
		}

		private function doLoad(url:String, format:String, func:Function):void {
			var request:URLRequest = new URLRequest(url);
			var loader:URLLoader = new URLLoader();
			dataFormat = format;
			addEventListener(Event.COMPLETE, func);
			load(request);
		}

		private function onLoadText(event:Event):void {
			removeEventListener(Event.COMPLETE, onLoadText);
			onLoad(event.currentTarget.data, String);
		}

		private function onLoadZip(event:Event):void {
			removeEventListener(Event.COMPLETE, onLoadZip);
			onLoad(event.currentTarget.data, ByteArray);
		}

		private function onLoad(data:Object, clazz:Class):void {
			var se:SculpteoLoaderEvent = new SculpteoLoaderEvent(
				SculpteoLoaderEvent.COMPLETE);

			var designData:DesignData = new DesignData();
			designData.file = data as clazz;
			se.data =designData;

			dispatchEvent(se);
		}
	}
}