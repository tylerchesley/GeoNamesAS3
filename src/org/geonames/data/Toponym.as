package org.geonames.data
{
	
	/**
	 * Encapsulates a toponym.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#cities
	 * @see org.geonames.GeoNamesService#findNearby
	 * @see org.geonames.GeoNamesService#extendedFindNearby
	 * @see org.geonames.GeoNamesService#findNearbyPlacename
	 * @see org.geonames.GeoNamesService#getToponym
	 * @see org.geonames.GeoNamesService#search
	 */	
	public class Toponym
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>Toponym</code> object.</p>
		 */		
		public function Toponym()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var adminCode1:String;
		
		public var adminCode2:String;
		
		public var adminCode3:String;
		
		public var adminCode4:String;
		
		public var adminName1:String;
		
		public var adminName2:String;
		
		public var alternateNames:String;
		
		public var alternateNamesByLanguage:Object;
		
		public var continentCode:String;
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var distance:Number;
		
		public var elevation:Number;
		
		public var featureClass:String;
		
		public var featureClassName:String;
		
		public var featureCode:String;
		
		public var featureCodeName:String;
		
		public var geoNameId:int;
		
		public var latitude:Number;
		
		public var longitude:Number;
		
		public var name:String;
		
		public var numberOfChildren:Number;
		
		public var population:Number;
		
		public var style:String;
		
		public var timezone:Timezone;
	
	}
}