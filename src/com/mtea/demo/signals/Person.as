package com.mtea.demo.signals
{
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Spacer;
	
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.natives.NativeSignal;

	public class Person extends EventDispatcher
	{
		public var stringSignal:Signal;
		public var stringForOnceSignal:Signal;
		public var deluxeSignal:DeluxeSignal;
		public var timerSignal:NativeSignal;
		public var clickSignal:NativeSignal;
		public var timer:Timer;
		
		public function Person()
		{
			//限定dispatch的参数类型: new Signal(String);
			stringSignal = new Signal(String);
			stringForOnceSignal = new Signal(String);
			deluxeSignal = new DeluxeSignal(this);
			
			timer = new Timer(2000);
			timerSignal = new NativeSignal(timer,TimerEvent.TIMER,TimerEvent);
			
			clickSignal = new NativeSignal(this,MouseEvent.CLICK,MouseEvent);
		}
		
		public function sayNothing():void{
			stringSignal.dispatch("");
		}
		
		public function saySomething(something:String):void{
			stringSignal.dispatch(something);
		}
		
		public function saySomethingMoreTimes(something:String):void{
			for(var i:int = 0; i < 10; i++){
				stringForOnceSignal.dispatch(something);
			}
		}
		
		public function run():void{
			deluxeSignal.dispatch(new GenericEvent());
		}
		
		public function startTimer():void{
			timer.start();
		}
		
		public function manualClick():void{
			this.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
	}
}