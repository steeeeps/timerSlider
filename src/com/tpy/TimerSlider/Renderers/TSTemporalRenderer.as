package  com.tpy.TimerSlider.Renderers
{
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.MapPoint;
	import com.esri.ags.geometry.Polyline;
	import com.esri.ags.renderers.Renderer;
	import com.esri.ags.symbols.SimpleMarkerSymbol;
	import com.esri.ags.symbols.Symbol;
	
	/**
	 * 按时间渲染样式
	 * 对使用的graphic需添加字段:TS_LATEST:Boolen,TS_ALPHA:Number,TS_SIZE:Number
	 * @author taopengyu
	 * 
	 */	
	public class TSTemporalRenderer extends Renderer
	{
		private var _latestObservationRenderer:Renderer;
		private var _observationRenderer:Renderer;
		private var _trackRenderer:Renderer;
		private var _symbolAger:TSSymbolAger;
		
		public function TSTemporalRenderer(latestObservationRenderer:Renderer=null,										  
										   trackRenderer:Renderer=null,
										   observationRenderer:Renderer=null,
										   symbolAger:TSSymbolAger=null)
		{
			super();
			
			this.latestObservationRenderer=latestObservationRenderer;
			this.observationRenderer=observationRenderer;
			this.trackRenderer=trackRenderer;
			this.symbolAger=symbolAger;
		}

			
		public function get symbolAger():TSSymbolAger
		{
			return _symbolAger;
		}
		/**
		 * 样式属性 
		 * @return  TSSymbolAger
		 * 
		 */	
		public function set symbolAger(value:TSSymbolAger):void
		{
			_symbolAger = value;
		}
 
		
		public function get trackRenderer():Renderer
		{
			return _trackRenderer;
		}

		/**
		 * 线路渲染样式 
		 * @return  Renderer
		 * 
		 */		
		public function set trackRenderer(value:Renderer):void
		{
			_trackRenderer = value;
		}

		
		public function get observationRenderer():Renderer
		{
			return _observationRenderer;
		}

		/**
		 * 所经过位置渲染样式 
		 * @return  Renderer
		 * 
		 */		
		public function set observationRenderer(value:Renderer):void
		{
			_observationRenderer = value;
		}

			
		public function get latestObservationRenderer():Renderer
		{
			return _latestObservationRenderer;
		}

		/**
		 * 当前位置渲染样式 
		 * @return  Renderer
		 * 
		 */	
		public function set latestObservationRenderer(value:Renderer):void
		{
			_latestObservationRenderer = value;
		}

		override public function getSymbol(graphic:Graphic):Symbol
		{
			if(graphic.geometry is MapPoint)
			{
				if(graphic.attributes.TS_LATEST=="TRUE")
				{
					return latestObservationRenderer.getSymbol(graphic);
				}
				else
				{
					if(observationRenderer!=null)
					{
						return observationRenderer.getSymbol(graphic);
					}
					else						
					{
						return createSimpleMarkerSymbol(graphic);
					}
				}
			}
			if(graphic.geometry is Polyline)
			{
				return trackRenderer.getSymbol(graphic);
			}
			return null;
		}
		
		/**
		 * 创建简单点符号 
		 * @param graphic
		 * @return  SimpleMarkerSymbol
		 * 
		 */		
		private function createSimpleMarkerSymbol(graphic:Graphic):SimpleMarkerSymbol
		{
			var symbol:SimpleMarkerSymbol=new SimpleMarkerSymbol();
			
			var alpha:Number=graphic.attributes.TS_ALPHA;
			var size:Number=graphic.attributes.TS_SIZE;
			if(alpha<=symbolAger.fromAlpha)
			{
				symbol.alpha=symbolAger.fromAlpha;
			}
			else if(alpha>=symbolAger.toAlpha)
			{
				symbol.alpha=symbolAger.toAlpha;
			}
			else
			{
				symbol.alpha=alpha;
			}
			if(size<=symbolAger.fromSize)
			{
				symbol.size=symbolAger.fromSize;
			}
			else if(size>=symbolAger.toSize)
			{
				symbol.size=symbolAger.toSize;
			}
			else
			{
				symbol.size=size;
			}
			symbol.color=symbolAger.color;
			
			return symbol;
		}
	}
}