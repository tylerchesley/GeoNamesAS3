package org.geonames.data
{
	/**
	 * Encapsulates a country.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#countryInfo
	 */	
	public class Country
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>Country</code> object.
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