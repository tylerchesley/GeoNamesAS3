package org.geonames.data
{
	/**
	 * Encapsulates a street segment.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearbyStreets
	 * @see org.geonames.GeoNamesService#findNearbyStreetsOSM
	 */	
	public class StreetSegment extends PostalCode
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>StreetSegment</code> object.</p>
		 */		
		public function StreetSegment()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var line:String;
		
		public var mtfcc:String;
		
		public var latitudes:Array;
		
		public var longitudes:Array;
		
		public var cfcc:String;

		public var fraddl:String;

		public var fraddr:String;

		public var toaddl:String;

		public var toaddr:String;
		
		public var placeName:String;
	
	}
}