package org.geonames.data
{
	[Bindable]
	public class Timezone
	{
		public function Timezone(dstOffset:Number, gmOffset:Number, timezone:String)
		{
			this.dstOffset = dstOffset;
			this.gmtOffset = gmOffset;
			this.timezone = timezone;
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var dstOffset:Number;
		
		public var gmtOffset:Number;
		
		public var timezone:String;
		
	}
}