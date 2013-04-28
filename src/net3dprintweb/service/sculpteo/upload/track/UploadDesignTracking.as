package net3dprintweb.service.sculpteo.upload.track
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	import net3dprintweb.service.sculpteo.config.UploadDesignTrackingConfig;
	import net3dprintweb.service.sculpteo.events.UploadDesignTrackingEvent;
	import net3dprintweb.service.sculpteo.upload.track.data.UploadDesignTrackingData;

	public class UploadDesignTracking extends EventDispatcher
	{
		private  const STATE_STARTING:String = "starting";
		private  const STATE_UPLODING:String = "uploading";
		private  const STATE_ERROR:String = "error";
		private  const STATE_DONE:String = "done";

		private var _trackId:String;
		private var _trackLoader:URLLoader = new URLLoader();
		private var _config:UploadDesignTrackingConfig = new UploadDesignTrackingConfig();

		public function start(trackId:String):void {
			_trackId = trackId;
			_trackLoader.addEventListener(Event.COMPLETE, onComplete);
			_trackLoader.load(createTrackingRequest());
		}

		public function stop():void {
			_trackId = null;
			_trackLoader.removeEventListener(Event.COMPLETE, onComplete);
		}

		private function createTrackingRequest():URLRequest {
			var ret:URLRequest = new URLRequest(_config.URL + _trackId);
			ret.method = URLRequestMethod.GET;
			return ret;
		}

		private function onComplete(event:Event):void {
			var data:Object = JSON.parse(event.currentTarget.data);
			var trackData:UploadDesignTrackingData = null;
			var trackEvent:UploadDesignTrackingEvent = new UploadDesignTrackingEvent(
				UploadDesignTrackingEvent.TRACKING);

			trackEvent.state = data.state;
			var size:Number = data.hasOwnProperty("size") ? data["size"] : -1;
			var received:Number = data.hasOwnProperty("received") ? data["size"] : -1;
			if (size != -1 && received != -1) {
				trackData = new UploadDesignTrackingData();
				trackData.size = size;
				trackData.received = received;
			}
			trackEvent.data = trackData;
			dispatchEvent(trackEvent);
			switch(data.state) {
				case STATE_STARTING:
				case STATE_UPLODING:
					_trackLoader.load(createTrackingRequest());
					break;
				case STATE_ERROR:
				case STATE_DONE:
					stop();
					break;
			}
		}
	}
}