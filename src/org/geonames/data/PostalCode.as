package org.geonames.data
{
	
	/**
	 * Encapsulates a postal code.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearbyPostalCodes
	 * @see org.geonames.GeoNamesService#postalCodeSearch
	 */	
	public class PostalCode
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>PostalCode</code> object.</p>
		 */		
		public function PostalCode()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var adminCode1:String;
		
		public var adminCode2:String;
		
		public var adminCode3:String;
		
		public var adminName1:String;
		
		public var adminName2:String;
		
		public var adminName3:String;
		
		public var countryCode:String;
		
		public var distance:Number;
		
		public var latitude:Number;
		
		public var longitude:Number;
		
		public var name:String;
		
		public var postalCode:String;
	
	}
}