package org.geonames.data
{
	
	/**
	 * Encapsulates a neighourhood.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#neighourhood
	 */	
	public class Neighbourhood
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>Neighbourhood</code> object.
		 */		
		public function Neighbourhood()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var adminCode1:String;
		
		public var adminName1:String;
		
		public var adminCode2:String;
		
		public var adminName2:String;
		
		public var city:String;
		
		public var name:String;
		
	}
}