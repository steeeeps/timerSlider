#timerSlider 
很久之前做的动态演示项目，基于ags flex api，根据一个有时间属性的图层，把图层上的要素按时间顺序绘制出来，并绘制路线。  

Esri在线帮助文档提供了例子和控件TimeSlider，能够满足实现这个功能，但是貌似TimeSlider只支持10以上的版本。  

如果在10以下的版本使用的话，只有在timeExtentChange事件下对要素进行绘制，但是TimeSlider没有提供当前时间站点属性，我没有找到使用后退、前进的方法。 

项目需要，自己仿照着写了一个timeSlider，能够按照时间来绘制要素，并绘制要素的行动路线，支持前进、后退及回放。

适用于**Arcgis Server 10.0**以下版本。


----------
**调用代码：**

      timeSlider.graphicsLayer=graphicsLayer;
    //设置graphicsLayer
    
    //timeSlider.renderer=renderer;
    //设置渲染样式(如果添加的graphicsLayer有样式的话则不用)
    
    timeSlider.graphicSet=_graphicsArray;
    //设置一个有时间顺序的graphics数组
    
    var timeEx:MyTimeExtent=newMyTimeExtent(startTime,endTime);
    //设置时间范围timeSlider.createTimeStopsByTimeInterval(timeEx,_timeStopsInterval,_timeStopsUnits);
    //根据时间范围、时间间隔和时间单位创建时间站点
    
    //后面就可以直接开始了。  

如果不需要内部绘制图形的方法，也可以直接调用内部提供的站点改变事件，而不用设置graphicSet，来调用自己的绘制方法：

**代码如下：**

    timeSlider.addEventListener(TimerSliderEvent.TIME_STOP_CHANGE,onTimeStopChange);
    
    private function onTimeStopChange(e: TimerSliderEvent):void
    {
    
    
    var currentStop:int= e.currentTimeStop;
    //当前时间站点
    
         //
    }



   

