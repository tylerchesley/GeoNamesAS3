package org.geonames.criteria
{
	public class FindNearbyPostalCodesCriteria
	{
		public function FindNearbyPostalCodesCriteria()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var postalcode:String;
		
		public var lat:Number;
		
		public var lng:Number;
		
		public var radius:Number;
		
		/**
		 * @default 5 
		 */		
		public var maxRows:uint = 5;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		/**
		 * @default "MEDIUM" 
		 */		
		public var style:String;
		
		public var country:String;
		
		public var localCountry:String;
		
	}
}