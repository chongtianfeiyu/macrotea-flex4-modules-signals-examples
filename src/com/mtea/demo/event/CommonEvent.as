package com.mtea.demo.event
{
	import flash.events.Event;

	public class CommonEvent extends Event
	{
		public static var ADD_USER_TO_DEPT:String = "addUserToDept";
		
		public function CommonEvent(type:String,_data:Object)
		{
			super(type, false, false);
			this.data = _data;
		}
		
		public var data:Object;
	}
}
