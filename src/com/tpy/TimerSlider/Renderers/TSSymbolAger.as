package  com.tpy.TimerSlider.Renderers
{
	/**
	 * 样式属性 
	 * @author taopengyu
	 * 
	 */	
	public class TSSymbolAger
	{
		private var _fromAlpha:Number;
		private var _toAlpha:Number;
		private var _fromSize:Number;
		private var _toSize:Number;
		private var _color:Number
		public function TSSymbolAger(fromAlpha:Number,toAlpha:Number,fromSize:Number,toSize:Number,color:Number)
		{
			this.fromAlpha=fromAlpha;
			this.toAlpha=toAlpha;
			this.fromSize=fromSize;
			this.toSize=toSize;
			this.color=color;
		}

		public function get color():Number
		{
			return _color;
		}

		/**
		 * 颜色 
		 * @param value
		 * 
		 */		
		public function set color(value:Number):void
		{
			_color = value;
		}

		public function get toSize():Number
		{
			return _toSize;
		}
		/**
		 * 起始尺寸 
		 * @param value
		 * 
		 */
		public function set toSize(value:Number):void
		{
			_toSize = value;
		}

		public function get fromSize():Number
		{
			return _fromSize;
		}
		/**
		 * 终止尺寸 
		 * @param value
		 * 
		 */
		public function set fromSize(value:Number):void
		{
			_fromSize = value;
		}

		public function get toAlpha():Number
		{
			return _toAlpha;
		}
		/**
		 * 起始透明度 
		 * @param value
		 * 
		 */
		public function set toAlpha(value:Number):void
		{
			_toAlpha = value;
		}

		public function get fromAlpha():Number
		{
			return _fromAlpha;
		}
		/**
		 * 终止透明度 
		 * @param value
		 * 
		 */
		public function set fromAlpha(value:Number):void
		{
			_fromAlpha = value;
		}

	}
}