package org.geonames.data
{
	[Bindable]
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class Country
	{
		
		/**
		 * Constructor 
		 */		
		public function Country()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
	
		public var countryCode:String;
		
		public var countryName:String;
		
		public var isoNumeric:Number;
		
		public var isoAlpha3:String;
		
		public var fipsCode:String;
		
		public var continent:String;
		
		public var capital:String;
		
		public var areaInSqKm:Number;
		
		public var population:Number;
		
		public var currencyCode:String;
		
		public var languages:String;
		
		public var geonameId:Number;
		
		public var bBoxWest:Number;
		
		public var bBoxNorth:Number;
		
		public var bBoxEast:Number;
		
		public var bBoxSouth:Number;
	
	}
}