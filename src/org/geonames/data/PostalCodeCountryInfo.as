package org.geonames.data
{
	
	/**
	 * Encapsulates postal code country information.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#postalCodeCountryInfo
	 */	
	public class PostalCodeCountryInfo
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>PostalCodeCountryInfo</code> object.
		 */		
		public function PostalCodeCountryInfo()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var numPostalCodes:Number;
		
		public var minPostalCode:String;
		
		public var maxPostalCode:String;
		
	}
}