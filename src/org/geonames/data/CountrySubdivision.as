package org.geonames.data
{
	/**
	 * Encapsulates a country subdivision.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#countrySubdivision
	 */	
	public class CountrySubdivision
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>CountrySubdivision</code> object.
		 */		
		public function CountrySubdivision()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var adminCode1:String;
		
		public var adminName1:String;
		
		public var distance:Number;
		
		public var codes:Array;
	
	}
}