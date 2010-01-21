package org.geonames.criteria
{
	import org.geonames.codes.Style;
	
	/**
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 *
	 */
	public class FindNearbyCriteria
	{
		
		/**
		 * Constructor
		 *  
		 * @param latitude
		 * @param longitude
		 * 
		 * <p>Creates a new <code>FindNearbyCriteria</code> object.
		 */		
		public function FindNearbyCriteria(latitude:Number, longitude:Number)
		{
			this.lat = latitude;
			this.lng = longitude;
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var lat:Number;
		
		public var lng:Number;
		
		public var featureClass:String;
		
		public var featureCode:String;
		
		/**
		 * In kilometers 
		 */		
		public var radius:Number;
		
		/**
		 * @default 10 
		 */		
		public var maxRows:Number = 10;
		
		public var style:String = Style.MEDIUM;
		
	}
}