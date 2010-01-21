package org.geonames.data
{
	/**
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class StreetSegment extends PostalCode
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>StreetSegment</code> object.
		 */		
		public function StreetSegment()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var line:String;
		
		public var mtfcc:String;
		
		/**
		 * 
		 */		
		public var latitudes:Array;
		
		/**
		 * 
		 */		
		public var longitudes:Array;
		 
		
		public var cfcc:String;


		/**
		 * 
		 */		
		public var fraddl:String;

		/**
		 * 
		 */		
		public var fraddr:String;

		/**
		 * 
		 */		
		public var toaddl:String;

		/**
		 * 
		 */		
		public var toaddr:String;
		
		public var placeName:String;
	
	}
}