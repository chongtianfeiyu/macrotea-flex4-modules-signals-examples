package com.mtea.demo.module.signal
{
	import com.mtea.demo.vo.UserVo;
	
	import org.osflash.signals.Signal;

	public class UserModuleSignal
	{
		/* ------------------------ 核心 --------------------- */
		
		public function addUser(vo:UserVo):void
		{
			_userVoSignal.dispatch(vo);
		}
		
		/* ------------------------ 基本 --------------------- */
		
		private var _userVoSignal:Signal;
		
		private static var instance:UserModuleSignal;
		
		public function UserModuleSignal()
		{
			_userVoSignal = new Signal(UserVo);
		}
		
		public static function me():UserModuleSignal
		{
			if(instance==null) instance = new UserModuleSignal();
			return instance;
		}

		public function get userVoSignal():Signal
		{
			return _userVoSignal;
		}
		
	}
}