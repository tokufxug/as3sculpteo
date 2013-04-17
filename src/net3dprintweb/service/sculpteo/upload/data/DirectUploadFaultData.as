package net3dprintweb.service.sculpteo.upload.data
{
	public class DirectUploadFaultData
	{
		public var failureCause:String;
		public var body:Object;
		public var data:Object;

		public function toString():String {
			var ret:String = "";
			if (failureCause) {
				ret+=failureCause;
			}
			var name:String;
			if (body) {
				ret+="body{";
				for (name in body) {
					ret+=name + ":" + body[name] + "\n";
				}
				ret+="}\n";
			}
			if (data) {
				ret+="data{";
				for (name in data) {
					ret+=name + ":" + data[name] + "\n";
				}
				ret+="}\n";
			}
			return ret;
		}
	}
}