package net3dprintweb.service.sculpteo.upload
{
	import net3dprintweb.service.sculpteo.config.Config;
	import net3dprintweb.service.sculpteo.config.DirectUploadConfig;
	import net3dprintweb.service.sculpteo.events.DirectUploadEvent;
	import net3dprintweb.service.sculpteo.info.Account;
	import net3dprintweb.service.sculpteo.mapper.URLVariablesMapper;
	import net3dprintweb.service.sculpteo.materials.Ceramic;
	import net3dprintweb.service.sculpteo.materials.Other;
	import net3dprintweb.service.sculpteo.upload.data.DesignData;
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadFaultData;
	import net3dprintweb.service.sculpteo.upload.data.DirectUploadResultData;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;

	public class DirectUpload extends EventDispatcher
	{
		private var _config:DirectUploadConfig;
		private var _data:Object;
		public function DirectUpload(config:DirectUploadConfig)
		{
			_config = config;
		}

		public function upload(designData:DesignData, account:Account = null):void {
			var urlLoader:URLLoader = new URLLoader();

			urlLoader.addEventListener(Event.COMPLETE, onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
			urlLoader.load(createHttpURLRequest(designData, account));
		}

		private function createHttpURLRequest(designData:DesignData, account:Account):URLRequest {
			_config.isSSL = account != null;
			var ret:URLRequest = new URLRequest(_config.URL);

			ret.requestHeaders.push(
				new URLRequestHeader('X-Requested-With', 'XMLHttpRequest'));
			ret.method = URLRequestMethod.POST;
			ret.data = URLVariablesMapper.mapping(designData, account);
			_data = ret.data;
			return ret;
		}

		private function onComplete(event:Event):void {
			var data:String = event.currentTarget.data;
			var result:Object = null;
			try {
				result = JSON.parse(data);
				if (result.hasOwnProperty("failurecause")) {
					dispatchFault(result);
					return;
				}
				if (result.hasOwnProperty("uuid")) {
					dispatchResult(result);
					return;
				}
				dispatchFault(createFaultData(data));
			} catch (e:Error) {
				dispatchFault(createFaultData(data));
			} finally {
				_data = null;
			}
		}

		private function dispatchResult(result:Object):void {
			var resultData:DirectUploadResultData = new DirectUploadResultData();
			resultData.uuid = result.uuid;
			resultData.name = result.name;
			resultData.unit = result.unit;
			resultData.dimx = result.dimx;
			resultData.dimy = result.dimy;
			resultData.dimz = result.dimz;
			_config.setDesignURL(resultData);

			var se:DirectUploadEvent =
				new DirectUploadEvent(DirectUploadEvent.RESULT);
			se.result = resultData;
			dispatchEvent(se);
		}

		private function dispatchFault(fault:Object):void {
			var faultData:DirectUploadFaultData = new DirectUploadFaultData();
			faultData.failureCause = fault.failurecause;
			faultData.body = fault.body;
			faultData.data = fault.data;

			var se:DirectUploadEvent =
				new DirectUploadEvent(DirectUploadEvent.FAULT);
			se.fault = faultData;
			dispatchEvent(se);
		}

		private function createFaultData(value:String):DirectUploadFaultData {
			var faultData:DirectUploadFaultData = new DirectUploadFaultData();
			faultData.failureCause = "Response to unexpected";
			faultData.body = value;
			faultData.data =_data;
			return faultData;
		}

		private function onIOError(event:IOErrorEvent):void {
			dispatchEvent(event);
			_data = null;
		}

		private function onStatus(event:HTTPStatusEvent):void {
			dispatchEvent(event);
			_data = null;
		}
	}
}