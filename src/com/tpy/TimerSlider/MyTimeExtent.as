package  com.tpy.TimerSlider
{
	/**
	 * timerSlider时间属性类
	 * @author taopengyu
	 * 
	 */	
	public class MyTimeExtent
	{
		private var _startDate:Date;
		private var _endDate:Date;
		public function MyTimeExtent(startDate:Date,endDate:Date)
		{
			_startDate=startDate;
			_endDate=endDate;
		}

		public function get endDate():Date
		{
			return _endDate;
		}

		 
		/**
		 * 终止时间 
		 * @param value:Date
		 * 
		 */
		public function set endDate(value:Date):void
		{
			_endDate = value;
		}

		public function get startDate():Date
		{
			return _startDate;
		}

		/**
		 *起始时间 
		 * @param value:Date
		 * 
		 */
		public function set startDate(value:Date):void
		{
			_startDate = value;
		}

	}
}