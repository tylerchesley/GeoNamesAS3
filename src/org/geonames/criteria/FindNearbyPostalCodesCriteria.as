package org.geonames.criteria
{
	import org.geonames.codes.Style;

	public class FindNearbyPostalCodesCriteria
	{
		public function FindNearbyPostalCodesCriteria()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var lat:Number;
		
		public var lng:Number;
		
		/**
		 * @default 5 
		 */		
		public var maxRows:uint = 5;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		/**
		 * @default "MEDIUM" 
		 */		
		public var style:String = Style.MEDIUM;
		
		public var country:String;
		
		public var localCountry:String;
		
	}
}