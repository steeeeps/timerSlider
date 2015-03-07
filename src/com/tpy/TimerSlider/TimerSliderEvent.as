package  com.tpy.TimerSlider
{
	import flash.events.Event;
	
	public class TimerSliderEvent extends Event
	{
		private var _currentTimeStop:int;
		public static const TIMESTOPCHANGE:String="timeStopChange";
		public function get currentTimeStop():int
		{
			return _currentTimeStop;
		}

		public function set currentTimeStop(value:int):void
		{
			_currentTimeStop = value;
		}
		
		public function  TimerSliderEvent(type:String,timeStop:int):void
		{
			super(type);
			_currentTimeStop=timeStop;
		}
	}
}