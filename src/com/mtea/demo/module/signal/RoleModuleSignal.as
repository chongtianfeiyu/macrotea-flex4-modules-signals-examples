package com.mtea.demo.module.signal
{
	import org.osflash.signals.Signal;
	
	public class RoleModuleSignal
	{
		/* ------------------------ 核心 --------------------- */
		
		public function sendMessageToMain(data:String):void
		{
			_messageSignal.dispatch(data);
		}
		
		/* ------------------------ 基本 --------------------- */
		
		private var _messageSignal:Signal;
		
		private static var instance:RoleModuleSignal;
		
		public function RoleModuleSignal()
		{
			_messageSignal = new Signal(String);
		}
		
		public static function me():RoleModuleSignal
		{
			if(instance==null) instance = new RoleModuleSignal();
			return instance;
		}
		
		public function get messageSignal():Signal
		{
			return _messageSignal;
		}
		
	}
}