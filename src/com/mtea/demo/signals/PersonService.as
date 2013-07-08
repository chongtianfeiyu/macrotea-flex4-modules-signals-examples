package com.mtea.demo.signals
{
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	
	import org.osflash.signals.events.GenericEvent;

	[Bindable]
	public class PersonService
	{
		private var _person:Person;
		
		public static var dataCache:String = "<EMPTY>";
		
		public function PersonService()
		{
			person = new Person();
			person.stringSignal.add(personStringSignalHandler);
			person.stringForOnceSignal.addOnce(personStringForOnceSignalHandler);
			person.deluxeSignal.add(personDeluxeSignalHandler);
			person.timerSignal.add(personTimerSignalHandler);
			person.clickSignal.add(personClickSignalHandler);
		}
		
		public function personStringSignalHandler(data:String):void
		{
			trace(">> personStringSignalHandler");
			trace("data: " + data);
			if(dataCache==null || dataCache.length==0) dataCache="<EMPTY>";
			if(data==null || data.length==0) data="<EMPTY>";
			
			dataCache = dataCache + "\n" + data; 
		}
		
		public function personStringForOnceSignalHandler(data:String):void
		{
			trace(">> personStringForOnceSignalHandler");
			trace("data: " + data);
			if(dataCache==null || dataCache.length==0) dataCache="<EMPTY>";
			if(data==null || data.length==0) data="<EMPTY>";
			
			dataCache = dataCache + "\n" + data; 
		}
		
		public function personDeluxeSignalHandler(event:GenericEvent):void
		{
			trace(">> personDeluxeSignalHandler");
			
			var data:String = "event.signal: " + event.signal + ", event.target: " + event.target.toString(); 
			dataCache = dataCache + "\n" + data; 
		}
		
		public function personTimerSignalHandler(event:TimerEvent):void
		{
			trace(">> personTimerSignalHandler");
			
			var data:String = "timer is runing"; 
			dataCache = dataCache + "\n" + data; 
		}
		
		public function personClickSignalHandler(event:MouseEvent):void
		{
			trace(">> personClickSignalHandler");
			
			var data:String = "clicking"; 
			dataCache = dataCache + "\n" + data; 
		}
		
		public function remove_stringSignal_all():void
		{
			person.stringSignal.removeAll();
		}
		
		public function removePersonStringSignalHandler():void
		{
			person.stringSignal.remove(personStringSignalHandler);
		}

		public function get person():Person
		{
			return _person;
		}

		public function set person(value:Person):void
		{
			_person = value;
		}

	}
}