package org.geonames.criteria
{
	import org.geonames.codes.Style;
	
	/**
	 * Encapsulates the parameters for the <code>findNearbyPostalCodes</code> service.
	 * 
	 * <p>The service can take two different sets of parameters. You can either 
	 * pass the lat/long or a postalcode/placename. </p>
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearbyPostalCodes
	 * @see http://www.geonames.org/export/web-services.html#findNearbyPostalCodes
	 */	
	public class FindNearbyPostalCodesCriteria extends Criteria
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>FindNearbyPostalCodesCriteria</code> object.</p>
		 */		
		public function FindNearbyPostalCodesCriteria()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * If you do not set a postalcode you must set this value. 
		 */		
		public var lat:Number;
		
		/**
		 * If you do not set a postalcode you must set this value. 
		 */	
		public var lng:Number;
		
		/**
		 * The maximal number of rows in the document returned by 
		 * the service.
		 * 
		 * @default 5 
		 */		
		public var maxRows:uint = 5;
		
		/**
		 * @private
		 */		
		private var _style:String;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		
		/**
		 * Controls the verbosity of the returned results.
		 * 
		 * @default "MEDIUM" 
		 */	
		public function get style():String
		{
			return _style;
		}
		
		/**
		 * @private
		 */		
		public function set style(value:String):void
		{
			if (!validateEnumeration(value, Style))
			{
				throw new Error("Invalid style specified.");
			}
			
			_style = value;
		}
		
		/**
		 * @private
		 */		
		private var _country:String;
		
		/**
		 * An ISO-3166 country code. 
		 * 
		 * @default All countries.
		 */		
		public function get country():String
		{
			return _country;
		}
		
		/**
		 * @private
		 */		
		public function set country(value:String):void
		{
			if (value.length != 2)
			{
				throw new Error("Invalid country specified.");
			}
			
			_country = value;
		}
		
		/**
		 * In border areas this parameter will restrict the search on the 
		 * local country.
		 * 
		 * @default true 
		 */		
		public var localCountry:Boolean = true;
		
		/**
		 * The radius in kilometers to search within.
		 */		
		public var radius:uint;
		
		/**
		 * The postal code to search for.
		 */	
		public var postalcode:String;
		
	//------------------------------------------------------------------------------
	//	Overriden Methods
	//------------------------------------------------------------------------------
		
		override public function toString():String
		{
			if (!lat && !lng && !postalcode)
			{
				throw new Error("Either the latitude/longitude or the postalcode " +
					"must be specified.");
			}
			
			return super.toString();
		}
		
	}
}