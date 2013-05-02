package net3dprintweb.service.sculpteo.upload.data
{
	import flash.utils.ByteArray;

	import net3dprintweb.service.sculpteo.code.DesignUnit;

	public class DesignData
	{
		public var name:String;
		public var fileName:String;
		public var file:Object;
		public var description:String;
		public var keywords:String;
		public var isShares:Boolean = false;
		public var isPrintAuthorization:Boolean = true;
		public var isCustomizable:Boolean = true;
		public var designUnit:String;
		public var scale:Number;
		public var sizes:Vector.<Number>;
		public var materials:Vector.<String>;
		public var rotation:Rotation;
	}
}