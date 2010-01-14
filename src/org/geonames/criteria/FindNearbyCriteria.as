package org.geonames.criteria
{
	import org.geonames.codes.Style;

	public class FindNearbyCriteria
	{
		public function FindNearbyCriteria(latitude:Number, longitude:Number)
		{
			this.lat = latitude;
			this.lng = longitude;
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var lat:Number;
		
		public var lng:Number;
		
		public var featureClass:String;
		
		public var featureCode:String;
		
		/**
		 * In kilometers 
		 */		
		public var radius:Number;
		
		/**
		 * @default 10 
		 */		
		public var maxRows:Number = 10;
		
		public var style:String = Style.MEDIUM;
		
	}
}