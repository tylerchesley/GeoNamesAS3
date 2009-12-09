package org.geonames.data
{
	[Bindable]
	public class Timezone
	{
		public function Timezone()
		{
			
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var dstOffset:Number;
		
		public var gmtOffset:Number;
		
		public var latitude:Number;
		
		public var longitude:Number;
		
		public var rawOffset:Number;
		
		public var timezone:String;
		
		public var time:Date;
		
	}
}