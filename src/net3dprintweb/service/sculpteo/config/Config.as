/*
 * Copyright (c) 2013 tokufxug
 *
 *  Permission is hereby granted, free of charge, to any person obtaining
 *  a copy of this software and associated documentation files (the
 *  "Software"), to deal in the Software without restriction, including without
 *  limitation the rights to use, copy, modify, merge, publish, distribute,
 *  sublicense, and/or sell copies of the Software, and to permit persons
 *  to whom the Software is furnished to do so, subject to the following
 *  conditions:
 *
 *  The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
 * ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR
 * A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */
package net3dprintweb.service.sculpteo.config
{
	import net3dprintweb.service.sculpteo.code.Language;

	public class Config
	{
		private static const DEFAULT_HOST:String = "sculpteo.com";
		public var language:String = Language.ENGLISH;
		public var isSSL:Boolean = true;

		public function changeLaguage(value:String):void {
			language = value;
		}

		public function get URL():String {
			var scheme:String = isSSL ? "https://" : "http://";
			var host:String =  "www." + DEFAULT_HOST +"/" + language + "/";
			return scheme + host;
		}
	}
}